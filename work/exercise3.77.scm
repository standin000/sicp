(define (integral integrand initial-value dt)
  (cons-stream initial-value
	       (if (stream-null? (force integrand))
		   the-empty-stream
		   (integral (delay (stream-cdr (force integrand)))
			     (+ (* dt (stream-car (force integrand)))
				initial-value)
			     dt))))

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(stream-ref (solve (lambda (y) y) 1 0.001) 1000)
;Value: 2.716923932235896


