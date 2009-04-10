(define (eval-and exp env)
  (define (findfalse exp)
    (if (null? exp)
	#t
	(if (true? (eval (car exp) env))
	    (findfalse (cdr exp))
	    #f
	    )
	)
    )
  (findfalse (cdr exp))
  )

(define (eval-or exp env)
  (define (findtrue exp)
    (if (null? exp)
	#f
	(if (true? (eval (car exp) env))
	    #t
	    (findtrue (cdr exp))
	    )
	)
    )
  (findtrue (cdr exp))
  )

(2d-put! 'eval 'and  eval-and)

(2d-put! 'eval 'or eval-or)

(eval '(if (and (> 2 1) (> 3 2)) 1 0) the-global-environment)
;Value: 1

(eval '(if (and (> 1 2) -) 1 0) the-global-environment)
;Value: 0

(eval '(if (or (> 2 1) (> 1 2)) 1 0) the-global-environment)
;Value: 1

(eval '(if (or (> 1 2) (> 3 2)) 1 0) the-global-environment)
;Value: 1
