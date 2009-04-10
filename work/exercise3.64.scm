(define (stream-limit s tolerance)
  (if (< (abs (- (stream-car s) (stream-car (stream-cdr s)))) tolerance)
      (stream-car s)
      (stream-limit (stream-cdr s) tolerance)
      )
  )

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
		 (stream-map (lambda (guess)
			       (sqrt-improve guess x))
			     guesses)))
  guesses)

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 4 0.0001)
;Value: 2.0000000929222947

(sqrt 2 0.0001)
;Value: 1.4142156862745097

(sqrt 7 0.0001)
;Value: 2.64576704419029
