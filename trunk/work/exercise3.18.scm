(define (IsIn x unite)
  (cond ((null? unite) #f)
	((eq? x (car unite)) #t)
	(else (IsIn x (cdr unite)))
	)
  )

(define (iscycle list)
  (define (iscycle-helper track list)
    (cond
     ((null? list) #f)
     ((IsIn list track) #t)
     (else (iscycle-helper (cons list track) (cdr list)))
     )
    )
  (iscycle-helper '() list)
  )

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(iscycle z)
;#t

(iscycle '(a b c))
;#f

(iscycle (append '(a b c) z))
;#t
