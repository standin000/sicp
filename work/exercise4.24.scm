;use syntactic analysis separated version
(define analyze-count 0)
(define eval-count 0)

(define (eval exp env)
  (set! eval-count (+ eval-count 1))
  ((analyze exp) env))

(define (analyze exp)
  (set! analyze-count (+ analyze-count 1))
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((definition? exp) (analyze-definition exp))
	((if? exp) (analyze-if exp))
	((lambda? exp) (analyze-lambda exp))
	((begin? exp) (analyze-sequence (begin-actions exp)))
	((cond? exp) (analyze (cond->if exp)))
	((let? exp) (analyze (let->combination exp)))
	((application? exp) (analyze-application exp))
	(else
	 (error "Unknown expression type -- ANALYZE" exp))))

(eval '(let ((a 1) (b 2)) (if (> a b) a b)) the-global-environment)
;=> 2
(display analyze-count)
;12
(display eval-count)
;1

(eval '(define fib 
  (lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (if (= k 1)
	  1
	  (if (= k 0)
	      0
	      (+ (fb fb (- k 1)) (fb fb (- k 2)))))))))
      the-global-environment)
;=> ok

(eval '(fib 5) the-global-environment)
;=> 5

(display analyze-count)
;52
(display eval-count)
;3

(eval '(define (fib n)
  (let fib-iter ((a 1)
		 (b 0)
		 (count n))
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))) the-global-environment)
;=> ok 
(display analyze-count)
;80
(display eval-count)
;4
(eval '(fib 7) the-global-environment)
;=> 13

(display analyze-count)
;83
(display eval-count)
;5


;use original version.
(define (eval exp env)
  (set! eval-count (+ eval-count 1))
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
		(list-of-values (operands exp) env)))
	(else
	 (error "Unknown expression type -- EVAL" exp))))

(define eval-count 0)

(eval '(let ((a 1) (b 2)) (if (> a b) a b)) the-global-environment)
;=> 2

(display eval-count)
; 11

(eval '(define fib 
  (lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (if (= k 1)
	  1
	  (if (= k 0)
	      0
	      (+ (fb fb (- k 1)) (fb fb (- k 2)))))))))
      the-global-environment)
;=> ok

(eval '(fib 5) the-global-environment)
;=> 5

(display eval-count)
;=> 268

(eval '(define (fib n)
  (let fib-iter ((a 1)
		 (b 0)
		 (count n))
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))) the-global-environment)
;=> ok

(display eval-count)
;=> 270

(eval '(fib 7) the-global-environment)
;=> 13

(display eval-count)
;=> 400

;12 52 80 83
;11 268 270 400
; The fraction is 20% more or less.