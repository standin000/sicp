(define (let*->nested-lets exp)
  (define (expand-binds binds)
    (if (null? (cdr binds))
	(append (list 'let (list (car binds)))
		(let-body exp))
	(list 'let (list (car binds))
	      (expand-binds (cdr binds)))
	)
    )
  (expand-binds (let-binds exp))
  )
;Value: "let*->nested-lets --> #[compound-procedure 42 let*->nested-lets]"

(2d-put!
 'eval
 'let*
 (lambda (exp env)
   (eval (let*->nested-lets exp) env)))

(eval '(let* ((a 1) (b (+ a 2))) (if (> a b) a b) b) the-global-environment)
;Value: 3


