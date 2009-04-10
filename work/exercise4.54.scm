(define (require? exp) (tagged-list? exp 'require))

(define (require-predicate exp) (cadr exp))

(define (analyze exp)
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((require? exp) (analyze-require exp))
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

(define (analyze-require exp)
  (let ((pproc (analyze (require-predicate exp))))
    (lambda (env succeed fail)
      (pproc env
	     (lambda (pred-value fail2)
	       (if (not (true? pred-value))
		   (fail2)
		   (succeed 'ok fail2)))
	     fail))))


(driver-loop)


;;; Amb-Eval input:
(let ((a (amb 1 2 3 4 5)))
  (require (even? a))
  a)

;;; Starting a new problem 
;;; Amb-Eval value:
2

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
4

;;; Amb-Eval input:
try-again

;;; There are no more values of
(let ((a (amb 1 2 3 4 5))) (require (even? a)) a)

;;; Amb-Eval input:
;Quit!

