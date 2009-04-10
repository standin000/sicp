(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (union-set s1 s2)
  (cond ((null? s1) s2)
	((null? s2) s1)
	((element-of-set? (car s1) s2)
	 (union-set (cdr s1) s2))
	(else
	 (cons (car s1) (union-set (cdr s1) s2))
	 )
	)
  )

(union-set '(1 2 3) '(2 3 4))

(union-set '(1 3) '(2 4))

(union-set '(1 2) '(1 2 3 4))

;;; Evaluating expression 1 in current module (guile-user)
; => (1 2 3 4)

;;; Evaluating expression 2 in current module (guile-user)
; => (1 3 2 4)

;;; Evaluating expression 3 in current module (guile-user)
; => (1 2 3 4)
