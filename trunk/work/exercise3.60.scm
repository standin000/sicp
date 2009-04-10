; reference internet
(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
     (add-streams (scale-stream (stream-cdr s2)
				(stream-car s1))
                  (mul-series (stream-cdr s1) s2))))
; I think it produce approximate series
; 2 4 6 8 10... mul-series 1 3 5 7 9 should be 2 22 84...
; but it produce 2 12 40 100...

(define (add-streams s1 s2)
  (stream-map
   (lambda (e1 e2) (+ e1 e2))
   s1 s2))


(sum-series (add-streams (mul-series cosine-series cosine-series) (mul-series sine-series sine-series)) 1 100)
;Value: 1.

(sum-series (add-streams (mul-series cosine-series cosine-series) (mul-series sine-series sine-series)) 2 100)
;Value: 1.0000000000000004

(sum-series (add-streams (mul-series cosine-series cosine-series) (mul-series sine-series sine-series)) 3 100)
;Value: .9999999999999977

(sum-series (add-streams (mul-series cosine-series cosine-series) (mul-series sine-series sine-series)) 4 100)
;Value: .9999999999999525