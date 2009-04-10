(eval '(define (cons x y)
	 (lambda (m) (m x y))) the-global-environment)

(eval '(define (car z)
	 (z (lambda (p q) p))) the-global-environment)

(eval '(define (cdr z)
	 (z (lambda (p q) q))) the-global-environment)

(actual-value '(car '(a b c)) the-global-environment)
;Unknown procedure type -- APPLY (a b c)

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp env))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((let? exp) (eval (let->combination exp) env))
	((lambda? exp)
	 (make-procedure (lambda-parameters exp)
			 (lambda-body exp)
			 env))
	((begin? exp)
	 (eval-sequence (begin-actions exp) env))
	((cond? exp) (eval (cond->if exp) env))
	((application? exp)
	 (apply (actual-value (operator exp) env)
		(operands exp)
		env))
	(else
	 (error "Unknown expression type -- EVAL" exp))))

(define (text-of-quotation exp env)
  (if (or (symbol? (cadr exp)) (null? (cadr exp)))
      (cadr exp)
      (make-procedure '(m) 
		  (list 
		   (list 'm 
			 (list 'quote (car (cadr exp)))
			 (list 'quote (cdr (cadr exp)))))
		  env)
      )
  )

(actual-value '(car '(a b c)) the-global-environment)
; => a

(actual-value '(cdr '(a b c)) the-global-environment)
; => (procedure (m) ((m (quote b) (quote (c)))) ...


(actual-value '(car (cdr '(a b c))) the-global-environment)
; => b

(actual-value '(car (cdr (cdr '(a b c)))) the-global-environment)
; => c

(actual-value ''(a b c) the-global-environment)
; => (procedure (m) ((m (quote a) (quote (b c)))) ...

(actual-value ''() the-global-environment)
; => ()
