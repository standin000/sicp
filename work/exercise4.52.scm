(define (analyze exp)
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((if-fail? exp) (analyze-if-fail exp))
	((definition? exp) (analyze-definition exp))
	((permanent-set? exp) (analyze-permanent-set exp))
	((if? exp) (analyze-if exp))
	((lambda? exp) (analyze-lambda exp))
	((begin? exp) (analyze-sequence (begin-actions exp)))
	((cond? exp) (analyze (cond->if exp)))
	((let? exp) (analyze (let->combination exp)))
	((amb? exp) (analyze-amb exp))
	((application? exp) (analyze-application exp))
	(else
	 (error "Unknown expression type -- ANALYZE" exp))))
;Value: "analyze --> #[compound-procedure 10 analyze]"

(define (if-fail? exp)
  (tagged-list? exp 'if-fail))
;Value: "if-fail? --> #[compound-procedure 4 if-fail?]"

(define (if-fail-exp1 exp) (cadr exp))
;Value: "if-fail-exp1 --> #[compound-procedure 5 if-fail-exp1]"

(define (if-fail-exp2 exp) (caddr exp))
;Value: "if-fail-exp2 --> #[compound-procedure 6 if-fail-exp2]"

(define (analyze-if-fail exp)
  (let ((exp1 (analyze (if-fail-exp1 exp)))
	(exp2 (analyze (if-fail-exp2 exp))))
    (lambda (env succeed fail)
      (exp1 env succeed 
	    (lambda () (fail env succeed (exp2 env succeed fail)))
	    )
      )
    )
  )
;Value: "analyze-if-fail --> #[compound-procedure 8 analyze-if-fail]"

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
(if-fail (let ((x (an-element-of '(1 3 5))))
	   (require (even? x))
	   x)
	 'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value:
all-odd

;;; Amb-Eval input:
(if-fail (let ((x (an-element-of '(1 3 5 8))))
	   (require (even? x))
	   x)
	 'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value:
8

;;; Amb-Eval input:
;Quit!







