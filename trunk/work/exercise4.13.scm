; if it find first binding for variable, then remove it and exit, or it continue find
; in the whole environment until the last frame. 
(define (makeunbound! var env)
  (call-with-current-continuation
   (lambda (exit)
    (if (eq? env the-empty-environment)
	(error "Unbound variable" var)
	(operate-variable-value (lambda (frame) 
				  (makeunbound! var (enclosing-environment env)))
				(lambda (vals) (exit (remove-binding-to-frame! var (lookup-variable-value var env) (first-frame env))))
				var
				env)
	)
    )
   )
  )

(define (remove-binding-to-frame! var val frame)
  (set-car! frame (delq var (car frame)))
  (set-cdr! frame (delq val (cdr frame))))

(makeunbound! 'a the-global-environment)
;Value: #[unspecified-return-value]

(eval '(+ a 9) the-global-environment)
;Unbound variable a
;Type D to debug error, Q to quit back to REP loop: q
;Quit!
