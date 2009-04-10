;z is a->b->c-
;     ^<-----|
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(last-pair z)
;it is cycle list, so last-pair will be trapped in endless cycle.
