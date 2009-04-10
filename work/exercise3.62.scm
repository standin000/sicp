;;it seems this definition also works
(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      (error "Cannot divide by a series with 0 constant")
      (mul-series s1 (invert-unit-series s2)))
  )

(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      (error "Cannot divide by a series with 0 constant")
      (mul-series s1 
		  (scale-stream (invert-unit-series (scale-stream s2 (/ 1 (stream-car s2))))
				(/ 1 (stream-car s2))))))

(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      (error "Cannot divide by a series with 0 constant")
      (mul-series s1 
		  (scale-stream (invert-unit-series (scale-stream s2 (stream-car s2)))
				(stream-car s2)))))
;; tangent-series is OK when abs(x) < pi / 2, reference Taylor's theorem. 
(sum-series tangent-series 1 50)
;Value: 1.5574077244418496

(sum-series tangent-series 0.5 50)
;Value: .5463024898437903

(sum-series tangent-series 0.3 50)
;Value: .30933624960962325

; It is not precise enough in the range of pi / 2, it need more resource.
(sum-series tangent-series (/ 3.14 2) 67)
;Value: 41.6397029313306

(sum-series tangent-series 1.5 68)
;Value: 13.501748328858495



