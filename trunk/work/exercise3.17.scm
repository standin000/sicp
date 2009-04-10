(define (count-pairs x)
  (define (count-pairs-helper track x)
    (if (or (not (pair? x)) (IsIn x track))
	    0
	    (+ (count-pairs-helper (cons x track) (car x))
	       (count-pairs-helper (cons x track) (cdr x))
	       1)))
  (count-pairs-helper '() x)
  )

(define (IsIn x unite)
  (cond ((null? unite) #f)
	((eq? x (car unite)) #t)
	(else (IsIn x (cdr unite)))
	)
  )

(count-pairs '((a b)))
; 3

(count-pairs '((a b c)))
; 4

(count-pairs '((a b c d e f)))
; 7

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(count-pairs z)
; 3

