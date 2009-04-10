(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((let? exp) (eval (let->combination exp) env))
	((unless? exp) (eval (unless->if exp) env))
	((lambda? exp)
	 (make-procedure (lambda-parameters exp)
			 (lambda-body exp)
			 env))
	((begin? exp)
	 (eval-sequence (begin-actions exp) env))
	((cond? exp) (eval (cond->if exp) env))
	((application? exp)
	 (apply (eval (operator exp) env)
		(list-of-values (operands exp) env)))
	(else
	 (error "Unknown expression type -- EVAL" exp))))

(define (unless? exp)
  (tagged-list? exp 'unless))

(define (unless-cond exp)
  (cadr exp))

(define (unless-usual exp)
  (caddr exp))

(define (unless-exceptional exp)
  (cadddr exp))

(define (unless->if exp)
  (list 'if (unless-cond exp) (unless-exceptional exp)
	(unless-usual exp))
  )

(eval '(define (factorial n)
	 (unless (= n 1)
		 (* n (factorial (- n 1)))
		 1)) the-global-environment)

(eval '(factorial 5) the-global-environment)
; => 120

; Like expression below, if unless implemmented as a special form,
; We can not pass it as parameter f.
;; (define (combiner f cond n)
;;   (f cond
;;      (* n (combiner f (- n 1)))
;;      1
;;      )
;;   )
