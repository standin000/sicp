(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (union-set s1 s2)
  (append s1 s2)
  )

(define (adjoin-set x set)
      (cons x set)
  )

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(element-of-set? 1 '(1 2 1 3 3 4 3))
 
(element-of-set? 4 '(1 2 1 3 3 4 3))

(element-of-set? 5 '(1 2 1 3 3 4 3))

(union-set '(1 2 1 3 3 4 3) '( 2 3 2 3 4 5))

(adjoin-set 6 '(1 2 1 3 3 4 3))

(adjoin-set 3 '(1 2 1 3 3 4 3))

(intersection-set '(1 2 1 3 3 4 3) '( 2 3 2 3 4 5))

; ;;; Evaluating expression 1 in current module (guile-user)
;  => #t

; ;;; Evaluating expression 2 in current module (guile-user)
;  => #t

; ;;; Evaluating expression 3 in current module (guile-user)
;  => #f

; ;;; Evaluating expression 4 in current module (guile-user)
;  => (1 2 1 3 3 4 3 2 3 2 3 4 5)

; ;;; Evaluating expression 5 in current module (guile-user)
;  => (6 1 2 1 3 3 4 3)

; ;;; Evaluating expression 6 in current module (guile-user)
;  => (3 1 2 1 3 3 4 3)

; ;;; Evaluating expression 7 in current module (guile-user)
;  => (2 3 3 4 3)

;This representation let union-set & adjoin-set be more efficient, but
;element-of-set? & intersection-set will be less efficient, so it can
;be used when previous two operation are bottleneck.
 
 

