(define (equal? a b)
  (cond
   ((and (pair? a)
	(pair? b))
    (and (equal? (car a) (car b))
	  (equal? (cdr a) (cdr b))))
    ((eq? a b) #t)
    (else #f)
    )
  )

(equal? '(this is a list) '(this is a list))
;#t

(equal? '(this is a list) '(this (is a) list))
;#f

(equal? '(1 2 3) '(1 2 3))
;#t

(equal? '(1 2 3) '(1 2 4))
;#f

(equal? 3 (+ 1 2))
;#t
