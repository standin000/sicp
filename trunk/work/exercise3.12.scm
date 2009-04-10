(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
;Before define operation
;x: a->b
;y: c->d
(define z (append x y))
;z
;(a b c d)

;After define operation
;z: a->b->c->d, a new list
;x: a->b
;y: c->d
(cdr x);(b)
;(b)


(define w (append! x y))
;After define operation
;z: a->b->c->d, use x,y's space.
;x: a->b->c->d
;y: c->d

;w
;(a b c d)
(cdr x);(b c d)
;(b c d)