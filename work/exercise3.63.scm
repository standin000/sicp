(define (sqrt-stream x)
  (cons-stream 1.0
	       (stream-map (lambda (guess)
			     (sqrt-improve guess x))
			   (sqrt-stream x))))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
		 (stream-map (lambda (guess)
			       (sqrt-improve guess x))
			     guesses)))
  guesses)

;; if we defines guesses, we do need evaluate cons-stream operation of (sqrt-stream x),
;; guesses is a pair: a number and a promise and (sqrt-stream x) is a procedure.
;; they still differ in efficiency if our implementation of delay used only (lambda () <exp>) without using the
;; optimization provided by memo-proc for they are same in evaluating promise side.
