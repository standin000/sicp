Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess x)
    (if (good-enough? guess x)
	guess
	((iterative-improve good-enough? improve-guess)
	 (improve-guess guess x)
	 x)
	)
    )
  )
;Value: "iterative-improve --> #[compound-procedure 14 iterative-improve]"

(define (sqrt x) 
  ((iterative-improve sqrt-good-enough? sqrt-improve-guess?)
		  1 x)
  )
;Value: "sqrt --> #[compound-procedure 12 sqrt]"

(define (sqrt-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
;Value: "sqrt-good-enough? --> #[compound-procedure 8 sqrt-good-enough?]"

(define (sqrt-improve-guess? guess x)
  (average guess (/ x guess)))
;Value: "sqrt-improve-guess? --> #[compound-procedure 11 sqrt-improve-guess?]"

(define (average x y)
  (/ (+ x y) 2))
;Value: "average --> #[compound-procedure 10 average]"

(sqrt 4)
;Value: 2.0000000929222947

(sqrt 9)
;Value: 3.00009155413138

(sqrt 81)
;Value: 9.000011298790216

(define (fixed-point f guess)
  ((iterative-improve fixed-point-good? fixed-point-improve)
   guess f)
  )
;Value: "fixed-point --> #[compound-procedure 15 fixed-point]"

(define (fixed-point-good? guess f)
  (< (abs (- (f guess) guess)) 0.00001))
;Value: "fixed-point-good? --> #[compound-procedure 28 fixed-point-good?]"

(define (fixed-point-improve guess f)
  (f guess))
;Value: "fixed-point-improve --> #[compound-procedure 20 fixed-point-improve]"

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0)
  )
;Value: "sqrt --> #[compound-procedure 24 sqrt]"

(sqrt 4)
;Value: 2.0000000929222947

(sqrt 9)
;Value: 3.000000001396984

(sqrt 81)
;Value: 9.000000000007091









