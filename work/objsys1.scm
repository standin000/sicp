;;;
;;; Basic object system in Scheme
;;;

;;------------------------------------------------------------
;; Instance

; instance is an object which holds the "self" of a normal
; object instance.  It handles type requests, but otherwise
; passes all messages along to the handler procedure that it
; contains.
;
(define (make-instance)
  (let ((handler #f))
    (lambda (message)
      (case message
        ((SET-HANDLER!)
         (lambda (handler-proc)
           (set! handler handler-proc)))
        (else (get-method message handler))))))

; to create an instance 
;
(define (create-instance maker . args)
  (let* ((instance (make-instance))
         (handler (apply maker instance args)))
    (ask instance 'SET-HANDLER! handler)
    (if (method? (get-method 'INSTALL instance))
        (ask instance 'INSTALL))
    instance))

;;------------------------------------------------------------
;; Root Object


; Root object.  It contains the TYPE and IS-A methods.
; All classes should inherit (directly or indirectly) from root.
;
(define (make-root-object self)
  (lambda (message)
    (case message
      ((TYPE)
       (lambda () '(root)))
      ((IS-A)
       (lambda (type)
         (if (memq type (ask self 'TYPE)) #t #f)))
      (else
       (no-method)))))

;;------------------------------------------------------------
;; Object Interface

; ask
; 
; We "ask" an object to invoke a named method on some arguments.
;
(define (ask object message . args)
  ;; See your Scheme manual to explain `. args' usage
  ;; which enables an arbitrary number of args to ask.
  (let ((method (get-method message object)))
    (cond ((method? method)
           (apply method args))
          (else
           (error "No method for" message 'in 
                  (safe-ask 'UNNAMED-OBJECT
                            object 'NAME))))))

; Safe (doesn't generate errors) method of invoking methods
; on objects.  If the object doesn't have the method,
; simply returns the default-value.  safe-ask should only
; be used in extraordinary circumstances (like error handling).
;
(define (safe-ask default-value obj msg . args)
  (let ((method (get-method msg obj)))
    (if (method? method)
        (apply ask obj msg args)
        default-value)))

;;--------------------
;; Method Interface
;;
;; Objects have methods to handle messages.

; Gets the indicated method from the object or objects.
; This procedure can take one or more objects as 
; arguments, and will return the first method it finds 
; based on the order of the objects.
;
(define (get-method message . objects)
  (define (try objects)
    (if (null? objects)
        (no-method)
        (let ((method ((car objects) message)))
          (if (not (eq? method (no-method)))
              method
              (try (cdr objects))))))
  (try objects))

(define (method? x)
  (cond ((procedure? x) #T)
        ((eq? x (no-method)) #F)
        (else (error "Object returned this non-message:" x))))

(define no-method
  (let ((tag (list 'NO-METHOD)))
    (lambda () tag)))

; Use this inside each make-<object> class definition,
; in the TYPE method for that class, in order to add 
; to the type information for that new class.
;
(define (type-extend type . parents)
  (cons type 
        (remove-duplicates
         (append-map (lambda (parent) (ask parent 'TYPE))
                     parents))))

;;--------------------
;; show 
;;
;; Some utilities.
;;
;; Use (instance? obj) to see if obj is an instance.
;; Use (show-instance obj) to view an instance.
;; Use (show-handler proc) to view a message handler.
;;
;; Treat these as gifts from the (Scheme) Gods.  
;; Don't try to understand these procedures!

(define (instance? obj)
  (and (compound-procedure? obj)
       (let* ((env (procedure-environment obj))
              (bindings (environment-bindings env)))
         (and (assq 'handler bindings)
              #t))))

(define (show-instance obj)
  (define (show-guts obj)
    (let* ((env (procedure-environment obj))
           (bindings (environment-bindings env))
           (handler (cadr (assq 'handler bindings)))
           (type-list (ask obj 'TYPE)))
      (display "INSTANCE ") (display obj)
      (display "\n TYPE: ") (display type-list) (newline)
      (show-handler handler)
      'instance))
  (if (instance? obj)
      (show-guts obj) 
      'not-an-instance))

(define (show-handler proc)
  (define (show-frame frame depth)
    (define *max-frame-depth* 1)
    (if (global-environment? frame)
        (display (env-name frame))
        (let* ((bindings (environment-bindings frame))
               (parent   (environment-parent frame))
               (names    (cons "Parent frame"
                               (map symbol->string (map car bindings))))
               (values   (cons (env-name parent)
                               (map cadr bindings)))
               (width    (reduce max 0 (map string-length names))))
          (for-each (lambda (n v) (pp-binding n v width depth))
                    names values)
          (if (and (not (global-environment? parent))
                   (< depth *max-frame-depth*))
              (show-frame parent (+ depth 1))))))
  (define (global-environment? frame)
    (environment->package frame))
  (define (env-name env)
    (if (global-environment? env) 'GLOBAL-ENVIRONMENT env))
  (define (pp-binding name value width depth)
    (let ((value* (with-string-output-port
                      (lambda (port)
                        (if (pair? value)
                            (pretty-print value port #F (+ width 2))
                            (display value port))))))
      (display-spaces (* 2 (+ depth 1)))
      (display name) (display ": ")
      (display (make-string (- width (string-length name)) #\Space))
      (if (pair? value)
          (display (substring value* (+ width 2) (string-length value*)))
          (display value*))
      (newline)))
  (define (display-spaces num)
    (if (> num 0) (begin (display " ") (display-spaces (- num 1)))))
  (fluid-let ((*unparser-list-depth-limit* 5)
              (*unparser-list-breadth-limit* 6))
    (display " HANDLER FRAME: ")
    (display (env-name (procedure-environment proc)))  (newline)
    (show-frame (procedure-environment proc) 0)
    (display " HANDLER PROCEDURE:\n")
    (pretty-print (procedure-lambda proc) (current-output-port) #T 2)
    'handler))


