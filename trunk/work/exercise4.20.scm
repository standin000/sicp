;a:
(define (letrec? exp)
  (tagged-list? exp 'letrec))

(define (letrec->let exp)
  (let* ((variables (map car (let-binds exp)))
	 (exps (map cadr (let-binds exp)))
	 (set-variables (map (lambda (e) (list e ''*unassigned*))
			      variables))
	 (n -1)
	 (eval-exps (map
		     (lambda (e) 
		       (set! n (+ n 1))
		       (list (get-symbol n) e)
		       )
		     exps))
	 (m -1)
	 (reset-variables (map 
			   (lambda (e) 
			     (set! m (+ m 1))
			     (list 'set! e (get-symbol m))
			     )
			   variables
			   ))
	 )
    (append (list 'let set-variables 
	  (append (list 'let eval-exps) reset-variables))
    (let-body exp))
    )
  )

(define (get-symbol n)
  (define symbols '(a b c d e f g h i j k l m 
		      n o p q r s t u v w x y z))
  (if (< n 26)
      (list-ref symbols n)
      (symbol-append (list-ref symbols (remainder n 26))
		     (get-symbol (- n 26)))
      )
  )

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((let? exp) (eval (let->combination exp) env))
	((letrec? exp) (eval (letrec->let exp) env))
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

(eval '(letrec ((fact
		 (lambda (n)
		   (if (= n 1)
		       1
		       (* n (fact (- n 1)))))))
	 (fact 10)) the-global-environment)
; => 3628800

;b:
;use letrec
;E0:vars
;|
;E1:even?:*unassigned*, odd?:*unassigned*
;|
;E2:a:(lambda..., b:(lambda...
;            |->(set even? a) (set odd? b) (even? x)
;E0:vars      
;|
;E1:even?:(lambda..., odd?:(lambda...
;|
;E2:x:5
;|    
;|->(lambda... x)        


;
;use let
(eval '(define (f x)
	 (let ((even?
		(lambda (n)
		  (if (= n 0)
		      true
		      (odd? (- n 1)))))
	       (odd?
		(lambda (n)
		  (if (= n 0)
		      false
		      (even? (- n 1))))))
	   (even? x))) the-global-environment)
; => ok
(eval '(f 5) the-global-environment)
;ERROR: Unbound variable odd?
;
;E0:vars
;|                                    | 
;E1:even?:(lambda..., odd?:(lambda... E2:x : 5
                                      |->(lambda... x)
