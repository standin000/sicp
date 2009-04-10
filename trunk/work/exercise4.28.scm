;When the operator is a argument of a compound procedure,
;it has been delayed and if we do not get the actual value before
;aplly, it will cause a error!

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
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
	 (apply (eval (operator exp) env)
		(operands exp)
		env))
	(else
	 (error "Unknown expression type -- EVAL" exp))))

(eval '(define (id f) 
	 (f 1 2)
	 )
      the-global-environment)

(eval '(id +) the-global-environment)
;ERROR: Unknown procedure type -- APPLY (thunk + (((identity square try w id count false true car cdr cadr cons assoc display + - > = * list null?) (procedure (x) (x) #-3#) (procedure (x) ((* x x)) #-4#) (procedure (a b) ((if (= a 0) 1 b)) #-5#) (evaluated-thunk 10) (procedure (f) ((f 1 2)) #-7#) 2 #f #t (primitive #<primitive-procedure car>) (primitive #<primitive-procedure cdr>) (primitive #<primitive-procedure cadr>) (primitive #<primitive-procedure cons>) (primitive #<primitive-procedure assoc>) (primitive #<primitive-generic display>) (primitive #<primitive-procedure +>) (primitive #<primitive-procedure ->) (primitive #<primitive-procedure >>) (primitive #<primitive-procedure =>) (primitive #<primitive-procedure *>) (primitive #<primitive-procedure list>) (primitive #<primitive-procedure null?>))))
 => error-in-evaluation



