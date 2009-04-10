(define (eval exp env)
   (cond ((self-evaluating? exp) exp)
	 ((variable? exp) (lookup-variable-value exp env))
	 (else (let ((func (2d-get 'eval (type exp))))
		 (if (null? func)
		     (if (application? exp)
			 (apply (eval (operator exp) env)
				(list-of-values (operands exp) env))
			 ;it seems thise sentence can not be executed forever.
			 (error "Unknown expression type -- NEW EVAL" exp))
		     (func exp env))
		 )
	       )
	 )
   )

(define (type exp) (car exp))

(2d-put! 'eval 'quote (lambda (exp env) (text-of-quotation exp)))

(2d-put! 'eval 'set! eval-assignment)

(2d-put! 'eval 'define eval-definition)

(2d-put! 'eval 'if eval-if)

(2d-put! 
 'eval
 'lambda 
 (lambda (exp env) 
   (make-procedure (lambda-parameters exp)
		   (lambda-body exp)
		   env)))

(2d-put! 
 'eval 
 'begin
 (lambda (exp env)
 (eval-sequence (begin-actions exp) env)))

(2d-put!
 'eval
 'cond
 (lambda (exp env)
   (eval (cond->if exp) env)))

(eval '(begin (+ 3 4) (+ 4 6)) the-global-environment)
;Value: 10

(eval '(if (> 2 3) (quote 2) (quote 3)) the-global-environment)
;Value: 3

(eval '(define add (lambda (a b) (+ a b))) the-global-environment)
;Value: ok

(eval '(cond ((> 3 2) (add 2 3)) (else 3)) the-global-environment)
;Value: 5

(eval '(set! add 3) the-global-environment)
;Value: ok

(eval '(+ add 3) the-global-environment)
;Value: 6


 
