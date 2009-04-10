(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
	((= x (car set)) set)
	((< x (car set)) (cons x set))
	((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
	)
  )

(adjoin-set 4 '(1 2 5 6))

(adjoin-set 0 '(1 2 5 6))

(adjoin-set 7 '(1 2 5 6))

(adjoin-set 1 '(1 2 5 6))

(adjoin-set 6 '(1 2 5 6))

(adjoin-set 5 '(1 2 5 6))

; ;;; Evaluating expression 1 in current module (guile-user)
;  => (1 2 4 5 6)

; ;;; Evaluating expression 2 in current module (guile-user)
;  => (0 1 2 5 6)

; ;;; Evaluating expression 3 in current module (guile-user)
;  => (1 2 5 6 7)

; ;;; Evaluating expression 4 in current module (guile-user)
;  => (1 2 5 6)

; ;;; Evaluating expression 5 in current module (guile-user)
;  => (1 2 5 6)

; ;;; Evaluating expression 6 in current module (guile-user)
;  => (1 2 5 6)
