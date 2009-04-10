(define f
  (let ((x 1))
    (lambda (n)
      (let ((t x))
	(set! x n)
	(* t n)
	)
      )
    )
  )

(+ (f 0) (f 1)) ;left -> right
; 0
(+ (f 1) (f 0)) ;right -> left
; 1