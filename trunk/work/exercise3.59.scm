;reference a paper in internet so that I know it needs a power series.

(define (integrate-series s)
  (define (add-coefficient n s)
    (cons-stream (/ (stream-car s) n) (add-coefficient (+ n 1) (stream-cdr s))))
  (add-coefficient 1 s)
  )

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define (powers x)
  (cons-stream 1 (scale-stream (powers x) x)))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (mul-stream s1 s2)
  (stream-map (lambda (e1 e2) (* e1 e2)) s1 s2))

(define (sum-series s x n)
  (define (sum-helper s sum k)
    (if (< k n)
	(sum-helper (stream-cdr s) (+ (stream-car s) sum) (+ k 1))
	sum
	)
    )
  (sum-helper (mul-stream s (powers x)) 0 0))
  
(define cosine-series
  (cons-stream 1 (scale-stream (integrate-series sine-series) -1)))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(sum-series cosine-series 1 100)
;Value: .5403023058681397

(sum-series cosine-series 3.14 100)
;Value: -.9999987317275395

(sum-series sine-series 3.14 100)
;Value: 1.592652916487223e-3

(sum-series sine-series 1 100)
;Value: .8414709848078965