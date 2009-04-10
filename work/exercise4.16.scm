;a:
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
	     (env-loop (enclosing-environment env)))
	    ((eq? var (car vars))
	     (if (eq? (car vals) '*unassigned*)
		 (error '*unassigned*)
		 (car vals))
	     )
	    (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
	(error "Unbound variable" var)
	(let ((frame (first-frame env)))
	  (scan (frame-variables frame)
		(frame-values frame)))))
  (env-loop env))

(eval '(define a '*unassigned*) the-global-environment)
(eval '(display a) the-global-environment)
;ERROR: *unassigned*
; => error-in-evaluation

;b
(define (compose f g)
  (lambda (x)
    (f (g x))
    )
  )
(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))


(define (scan-out-defines body)
  (let* ((definitions (filter definition? body))
	 (not-definitions (filter (compose not definition? ) body))
	 (binds (map (lambda (e) (list (definition-variable e) ''*unassigned*))
		 definitions))
	 (body (append (map
			(lambda (e) 
			  (list 'set! 
				(definition-variable e) 
				(definition-value e)
				)
			  )
			definitions)
		       not-definitions)))
    (if (null? binds)
	body
	(list (append (list 'let binds) body))
	)
    )
  )

(scan-out-defines '((define u 1) (define v 2) (+ 1 2)))
;;; Evaluating in current module (guile-user)
;; => ((let ((u *unassigned*) (v *unassigned*)) (set! u 1) (set! v 2) (+ 1 2)))

;c:
(define (procedure-body p) (scan-out-defines (caddr p)))

(eval 
 '(define (f x)
   (define (even? n)
     (if (= n 0)
	 true
	 (odd? (- n 1))))
   (define (odd? n)
     (if (= n 0)
	 false
	 (even? (- n 1))))
   (if (> x 100)
       (even? x)
       (odd? x)
       )
   ) the-global-environment)

(eval '(f 200) the-global-environment)
;;; Evaluating in current module (guile-user)
; => #t

(eval '(f 98) the-global-environment)
;;; Evaluating in current module (guile-user)
; => #f