(define (let-name exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      '()
      )
  )
 
(define (let-binds exp) 
  (if (let-name exp)
      (caddr exp)
      (cadr exp)
      )
  )

(define (let-body exp) 
  (if (let-name exp)
      (cdddr exp)
      (cddr exp)
      )
  )
  
(define (let->combination exp)
  (let ((parameters (map car (let-binds exp)))
	(exps (map cadr (let-binds exp)))
	(name (let-name exp))
	)
    (if name
	(list 'begin (list 'define name (make-lambda parameters (let-body exp))) (append (list name) exps))
	(cons (make-lambda parameters (let-body exp)) exps)
	)
    )
  )

(eval '(define (fib n)
  (let fib-iter ((a 1)
		 (b 0)
		 (count n))
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))) the-global-environment)

(eval '(fib 3) the-global-environment)
;Value: 2

(eval '(fib 7) the-global-environment)
;Value: 13
