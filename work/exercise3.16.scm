(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))
;a->b
;return 3

(count-pairs '((a b)))
; 3

;a->b->c
;return 4
(count-pairs '((a b c)))
; 4

;a->b->c->d->e->f
;return 7
(count-pairs '((a b c d e f)))
; 7

; a->b->c-
; ^<-----|
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(count-pairs z)
;EXCEPTION: stack-overflow (#f "Stack overflow" #f #f)
