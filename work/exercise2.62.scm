(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	(else
	 (let ((x1 (car set1)) (x2 (car set2)))
	   (cond 
	    ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
	    ((> x2 x1) (cons x1 (union-set (cdr set1) set2)))
	    (else (append (list x2 x1) (union-set (cdr set1) (cdr set2))))
	    )
	   )
	 )
	)
  )

(union-set '(1 2 3) '(2 3 4))

(union-set '(1 2) '(3 4))

(union-set '(1 2 3) '(0 3 4))

(union-set '(1 2 3) '(1 2 3))

; ;;; Evaluating expression 1 in current module (guile-user)
;  => (1 2 3 4)

; ;;; Evaluating expression 2 in current module (guile-user)
;  => (1 2 3 4)

; ;;; Evaluating expression 3 in current module (guile-user)
;  => (0 1 2 3 4)

; ;;; Evaluating expression 4 in current module (guile-user)
;  => (1 2 3)

