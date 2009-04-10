(define (set-variable-value! var val env)
  (call-with-current-continuation
   (lambda (exit)
    (if (eq? env the-empty-environment)
	(error "Unbound variable" var)
	(operate-variable-value (lambda (frame) (set-variable-value! var val (enclosing-environment env)))
				(lambda (vals) (exit (set-car! vals val)))
				var
				env)
	)
    )
   )
  )

(define (define-variable! var val env)
  (operate-variable-value (lambda (frame) (add-binding-to-frame! var val frame))
			  (lambda (vals) (set-car! vals val))
			  var
			  env)

   )

(define (lookup-variable-value var env)
  (call-with-current-continuation
   (lambda (exit)
    (if (eq? env the-empty-environment)
	(error "Unbound variable" var)
	(operate-variable-value (lambda (frame) (lookup-variable-value var (enclosing-environment env)))
				(lambda (vals) (exit (car vals)))
				var
				env)
	)
    )
   )
  )


(define (operate-variable-value op1 op2 var env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
	     (op1 frame))
	    ((eq? var (car vars))
	     (op2 vals))
	    (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
	  (frame-values frame))))


(eval '(define a 9) the-global-environment)
;Value: ok

(eval '(+ a 10) the-global-environment)
;Value: 19

(lookup-variable-value 'a the-global-environment)
;Value: 9

(eval '(set! a 10) the-global-environment)
;Value: ok

(eval '(+ a 8) the-global-environment)
;Value: 18

(eval '((lambda (a b) 
	 ((lambda (a) 
	   (set! a 8) 
	   (display a) 
	   (set! b 4) 
	   (display b)) 7)
	 (set! a 7) 
	 (display a)) 9 10)
      the-global-environment)

((lambda (a b) 
	 ((lambda (a) 
	   (set! a 8) 
	   (display a) 
	   (set! b 4) 
	   (display b)) 7)
	 (set! a 7) 
	 (display a)) 9 10)
847
;Value: #[unspecified-return-value]

