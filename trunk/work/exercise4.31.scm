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
	 (apply (actual-value (operator exp) env)
		(operands exp)
		env))
	(else
	 (error "Unknown expression type -- EVAL" exp))))


(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
	 (apply-primitive-procedure
	  procedure
	  (list-of-arg-values arguments env))) ; changed
	((compound-procedure? procedure)
	 (eval-sequence
	  (procedure-body procedure)
	  (extend-environment
	   (map (lambda (e) (if (symbol? e) e (car e)))
		(procedure-parameters procedure))
	   (list-of-delayed-args arguments 
				 (procedure-parameters procedure)
				 env) ; changed
	   (procedure-environment procedure))))
	(else
	 (error
	  "Unknown procedure type -- APPLY" procedure))))

(define (list-of-delayed-args exps parameters env)
  (if (no-operands? exps)
      '()
      (cond ((symbol? (car parameters))
	     (cons (actual-value (first-operand exps) env)
		   (list-of-delayed-args (rest-operands exps)
					 (cdr parameters)
					 env)))
	    ((eq? 'lazy-memo (cadar parameters))
	     (cons (delay-it (first-operand exps) env)
		   (list-of-delayed-args (rest-operands exps)
					 (cdr parameters)
					 env)))
	    ((eq? 'lazy (cadar parameters))
	     (cons (delay-it-without-memo (first-operand exps) env)
		   (list-of-delayed-args (rest-operands exps)
					 (cdr parameters)
					 env)))
	     )
      )
  )

(define (force-it obj)
  (cond ((thunk? obj)
	 (let ((result (actual-value
			(thunk-exp obj)
			(thunk-env obj))))
	   (set-car! obj 'evaluated-thunk)
	   (set-car! (cdr obj) result) ; replace exp with its value
	   (set-cdr! (cdr obj) '()) ; forget unneeded env
	   result))
	((thunk-without-memo? obj)
	 (actual-value
	  (thunk-exp obj)
	  (thunk-env obj))
	 )
	((evaluated-thunk? obj)
	 (thunk-value obj))
	(else obj)))


(define (delay-it-without-memo exp env)
  (list 'thunk-without-memo exp env))

(define (thunk-without-memo? obj)
  (tagged-list? obj 'thunk-without-memo))
(define (thunk-without-memo-exp thunk) (cadr thunk))
(define (thunk-without-memo-env thunk) (caddr thunk))


(eval '(define (f a (b lazy) c (d lazy-memo)) (+ a b)) the-global-environment)

(eval '(f 1 2 3 (/ 1 0)) the-global-environment)
; => 3

(eval '(f 1 2 (/ 1 0) (/ 1 0)) the-global-environment)
;; ERROR: In procedure /:
;; ERROR: Numerical overflow
;;  => error-in-evaluation

(eval '(f 1 (/ 1 0) 3 (/ 1 0)) the-global-environment)
;;; Evaluating in current module (guile-user)
;; ERROR: In procedure /:
;; ERROR: Numerical overflow
;;  => error-in-evaluation

(eval '(define (square (x lazy-memo)) (* x x)) the-global-environment)

(eval '(define count 0) the-global-environment)

(eval '(define (id x) 
	 (set! count (+ count 1))
	 x)
      the-global-environment)

(eval '(square (id 10)) the-global-environment)
; => 100

(eval 'count the-global-environment)
; => 1

(eval '(define (square (x lazy)) (* x x)) the-global-environment)

(eval '(define count 0) the-global-environment)

(eval '(define (id x) 
	 (set! count (+ count 1))
	 x)
      the-global-environment)

(eval '(square (id 10)) the-global-environment)
; => 100

(eval 'count the-global-environment)
; => 2





