;mystery will return a list which is reverse with original list
;and original variables will just hold its first element.
(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

(display v)
;(a)

(display w)
;(d c b a)

; describe the parameter of loop in process
; a->b->c->d '()
; b->c->d    a ;the cdr of x is mutated by '()
; c->d  b->a
; d  c->b->a
; '() d->c->b->a
; return d->c->b->a