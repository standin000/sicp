;;;
;;; basic object system in scheme
;;;

;;------------------------------------------------------------
;; instance

; instance is an object which holds the "self" of a normal
; object instance.  it handles type requests, but otherwise
; passes all messages along to the handler procedure that it
; contains.
;
(define (make-instance)
  (let ((handler '()))
    (lambda (message)
      (case message
        ((set-handler!)
         (lambda (handler-proc)
           (set! handler handler-proc)))
        (else (get-method message handler))))))

; to create an instance 
;
(define (create-instance maker . args)
  (let* ((instance (make-instance))
         (handler (apply maker instance args)))
    (ask instance 'set-handler! handler)
    (if (method? (get-method 'install instance))
        (ask instance 'install))
    instance))

;;------------------------------------------------------------
;; root object


; root object.  it contains the type and is-a methods.
; all classes should inherit (directly or indirectly) from root.
;
(define (make-root-object self)
  (lambda (message)
    (case message
      ((type)
       (lambda () '(root)))
      ((is-a)
       (lambda (type)
         (if (memq type (ask self 'type)) #t '())))
      (else
       (no-method)))))

;;------------------------------------------------------------
;; object interface

; ask
; 
; we "ask" an object to invoke a named method on some arguments.
;
(define (ask object message . args)
  ;; see your scheme manual to explain `. args' usage
  ;; which enables an arbitrary number of args to ask.
  (let ((method (get-method message object)))
    (cond ((method? method)
           (apply method args))
          (else
           (error "no method for" message 'in 
                  (safe-ask 'unnamed-object
                            object 'name))))))

; safe (doesn't generate errors) method of invoking methods
; on objects.  if the object doesn't have the method,
; simply returns the default-value.  safe-ask should only
; be used in extraordinary circumstances (like error handling).
;
(define (safe-ask default-value obj msg . args)
  (let ((method (get-method msg obj)))
    (if (method? method)
        (apply ask obj msg args)
        default-value)))

;;--------------------
;; method interface
;;
;; objects have methods to handle messages.

; gets the indicated method from the object or objects.
; this procedure can take one or more objects as 
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
  (cond ((procedure? x) #t)
        ((eq? x (no-method)) #f)
        (else (error "object returned this non-message:" x))))

(define no-method
  (let ((tag (list 'no-method)))
    (lambda () tag)))

; use this inside each make-<object> class definition,
; in the type method for that class, in order to add 
; to the type information for that new class.
;
(define (type-extend type . parents)
  (cons type 
        (remove-duplicates
         (append-map (lambda (parent) (ask parent 'type))
                     parents))))

;;------------------------------------------------------------
;; utility procedures

(define (random-number n)
  ;; generate a random number between 1 and n
  (+ 1 (random n)))

(define (pick-random lst)
  (if (null? lst)
      #f
      (list-ref lst (random (length lst)))))

(define (delq item lst)
  (cond ((null? lst) '())
        ((eq? item (car lst)) (delq item (cdr lst)))
        (else (cons (car lst) (delq item (cdr lst))))))

(define (filter predicate lst)
  (cond ((null? lst) '())
        ((predicate (car lst))
         (cons (car lst) (filter predicate (cdr lst))))
        (else (filter predicate (cdr lst)))))

(define (fold-right op init lst)
  (if (null? lst)
      init
      (op (car lst)
          (fold-right op init (cdr lst)))))

(define (remove-duplicates lst)
  (if (null? lst)
      '()
      (cons (car lst)
            (remove-duplicates (filter (lambda (x) 
                                         (not (eq? x (car lst))))
                                       lst)))))

;;; 
;;; family relationships
;;;

;; named-object
;;
(define (create-named-object name)
  (create-instance make-named-object name))

(define (make-named-object self name)
  (let ((root-part (make-root-object self)))
    (lambda (message)
      (case message
        ((type) (lambda () (type-extend 'named-object root-part)))
        ((name) (lambda () name))
        (else (get-method message root-part))))))

(define (names-of objects)
  ; given a list of objects, returns a list of their names.
  (map (lambda (x) (ask x 'name)) objects))


;; person
;;
(define (create-person name)
  (create-instance make-person name))

;; mother
;;
(define (create-mother name)
  (create-instance make-mother name))

(define (make-mother self name)
  (let ((person-part (make-person self name)))
    (lambda (message)
      (case message
        ((type) (lambda () (type-extend 'mother person-part)))
        ((have-child)
         (lambda (dad child-name)
           (let ((child (create-person child-name)))
             (ask child 'set-mother! self)
             (ask child 'set-father! dad)
             (ask self 'add-child child)
             (ask dad 'add-child child))))
        (else (get-method message person-part))))))

(define (make-person self name)
  (let ((named-part (make-named-object self name))
        (mother '())
        (father '())
        (children '())
        (siblings '()))
    (lambda (message)
      (case message
        ((type) (lambda () (type-extend 'person named-part)))
        ((say) (lambda (stuff) (display stuff)))
        ((mother) (lambda () mother))
        ((father) (lambda () father))
        ((children) (lambda () children))
        ((set-mother!) (lambda (mom) (set! mother mom)))
        ((set-father!) (lambda (dad) (set! father dad)))
        ((add-child)
         (lambda (child)
           (map 
	    (lambda (x) 
	      (ask x 'add-sibling child)
	      (ask child 'add-sibling x))
	    children)
           (set! children (cons child children))
           child))
        ((add-sibling)
         (lambda (sibling)
           (set! siblings (remove-duplicates (cons sibling siblings)))
           sibling))
        ((siblings)
         (lambda () siblings))
        (else (get-method message named-part))))))

(let* ((a (create-mother 'anne))
       (b (create-person 'bob))
       (c (ask a 'have-child b 'connie))
       (d (ask a 'have-child b 'david)))
  (names-of (ask d 'siblings)))
