
(define (analyze exp)
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((permanent-set? exp) (analyze-permanent-set exp))
	((definition? exp) (analyze-definition exp))
	((if? exp) (analyze-if exp))
	((lambda? exp) (analyze-lambda exp))
	((begin? exp) (analyze-sequence (begin-actions exp)))
	((cond? exp) (analyze (cond->if exp)))
	((let? exp) (analyze (let->combination exp)))
	((amb? exp) (analyze-amb exp))
	((application? exp) (analyze-application exp))
	(else
	 (error "Unknown expression type -- ANALYZE" exp))))
;Value: "analyze --> #[compound-procedure 6 analyze]"

(define (permanent-set? exp)
  (tagged-list? exp 'permanent-set!))
;Value: "permanent-set? --> #[compound-procedure 7 permanent-set?]"

(define (permanent-set-variable exp) (cadr exp))
;Value: "permanent-set-variable --> #[compound-procedure 8 permanent-set-variable]"

(define (permanent-set-value exp) (caddr exp))
;Value: "permanent-set-value --> #[compound-procedure 9 permanent-set-value]"

(define (analyze-permanent-set exp)
  (let ((var (permanent-set-variable exp))
	(vproc (analyze (permanent-set-value exp))))
    (lambda (env succeed fail)
      (vproc env
	     (lambda (val fail2) ; *1*
		 (set-variable-value! var val env)
		 (succeed 'ok
			  fail2
			  )
		 )
	     fail))))
;Value: "analyze-permanent-set --> #[compound-procedure 10 analyze-permanent-set]"

(driver-loop)


;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define count 0)

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(let ((x (an-element-of '(a b c)))
      (y (an-element-of '(a b c))))
  (permanent-set! count (+ count 1))
  (require (not (eq? x y)))
  (list x y count))

;;; Starting a new problem 
;;; Amb-Eval value:
(a b 2)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(a c 3)

;;; Amb-Eval input:
(define count 0)

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(let ((x (an-element-of '(a b c)))
      (y (an-element-of '(a b c))))
  (set! count (+ count 1))
  (require (not (eq? x y)))
  (list x y count))

;;; Starting a new problem 
;;; Amb-Eval value:
(a b 1)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(a c 1)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(b a 1)

;;; Amb-Eval input:
;Quit!

