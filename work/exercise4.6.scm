(define (let-binds exp) (cadr exp))
(define (let-body exp) (cddr exp))
(define (let->combination exp)
  (let ((parameters (map car (let-binds exp)))
	(exps (map cadr (let-binds exp))))
    (cons (make-lambda parameters (let-body exp))
	  exps)
    )
  )

(2d-put!
 'eval
 'let
 (lambda (exp env)
   (eval (let->combination exp) env)))


(eval '(let ((a 1) (b 2)) (if (> a b) a b)) the-global-environment)
;Value: 2