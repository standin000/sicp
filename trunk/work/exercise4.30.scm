;a 
(eval '(define (for-each proc items)
	 (if (null? items)
	     'done
	     (begin (proc (car items))
		    (for-each proc (cdr items)))))
      the-global-environment)

(eval '(for-each (lambda (x) (newline) (display x))
		 (list 57 321 88))
      the-global-environment)

;; 57
;; 321
;; 88\
;;  => done

; Because newline is not a parameter of compound procedure
; so it is not delayed.

;b
; original eval-sequence version
(eval '(define (p1 x)
	 (set! x (cons x '(2)))
	 x)
      the-global-environment)

(eval '(define (p2 x)
	 (define (p e)
	   e
	   x)
	 (p (set! x (cons x '(2)))))
      the-global-environment)

(eval '(p1 1) the-global-environment)
; => (1 2)

(eval '(p2 1) the-global-environment)
;;  => (thunk 1 (((p2 p1 for-each false true car cdr cadr cons assoc display newline + - > = * list null?) (procedure (x) ((define (p e) e x) (p (set! x (cons x (quote (2)))))) #-3#) (procedure (x) ((set! x (cons x (quote (2)))) x) #-4#) (procedure (proc items) ((if (null? items) (quote done) (begin (proc (car items)) (for-each proc (cdr items))))) #-5#) #f #t (primitive #<primitive-procedure car>) (primitive #<primitive-procedure cdr>) (primitive #<primitive-procedure cadr>) (primitive #<primitive-procedure cons>) (primitive #<primitive-procedure assoc>) (primitive #<primitive-generic display>) (primitive #<primitive-procedure newline>) (primitive #<primitive-procedure +>) (primitive #<primitive-procedure ->) (primitive #<primitive-procedure >>) (primitive #<primitive-procedure =>) (primitive #<primitive-procedure *>) (primitive #<primitive-procedure list>) (primitive #<primitive-procedure null?>))))

; Cy's eval-sequence version
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
	(else (actual-value (first-exp exps) env)
	      (eval-sequence (rest-exps exps) env))))

(eval '(define (p1 x)
	 (set! x (cons x '(2)))
	 x)
      the-global-environment)

(eval '(define (p2 x)
	 (define (p e)
	   e
	   x)
	 (p (set! x (cons x '(2)))))
      the-global-environment)

(eval '(p1 1) the-global-environment)
; => (1 2)

(eval '(p2 1) the-global-environment)
; => (1 2)

;c
(eval '(define (for-each proc items)
	 (if (null? items)
	     'done
	     (begin (proc (car items))
		    (for-each proc (cdr items)))))
      the-global-environment)

(eval '(for-each (lambda (x) (newline) (display x))
		 (list 57 321 88))
      the-global-environment)

;; 57
;; 321
;; 88\
;;  => done
; It is because newline is not delayed.

;d: I think Cy's approach is good, the evaluator can not know
; where need the expression's side effect, so it has better
; force it when it occur.

