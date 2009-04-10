Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define tolerance 0.00001)
;Value: "tolerance --> .00001"

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: "fixed-point --> #[compound-procedure 2 fixed-point]"

(define (compose f g)
  (lambda (x)
    (f (g x))
    )
  )
;Value: "compose --> #[compound-procedure 3 compose]"

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))
      )
  )
;Value: "repeated --> #[compound-procedure 4 repeated]"

(define (average a b)
  (/ (+ a b) 2))
;Value: "average --> #[compound-procedure 5 average]"

(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: "average-damp --> #[compound-procedure 6 average-damp]"

(define (exp x n)
  (if (= n 1)
      x
      (* x (exp x (- n 1)))
      )
  )
;Value: "exp --> #[compound-procedure 8 exp]"

(define (f x n)
  (lambda (y)
    (/
     x
     (exp y (- n 1))
     )
    )
  )
;Value: "f --> #[compound-procedure 11 f]"

;compute root of x^3 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 3)) 1)
;Value: 1.5874019442253338

;compute root of x^4 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 4)) 1)
;Value: 1.414213562373095

;compute root of x^5 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 5)) 1)
;Value: 1.3195084630174998

;compute root of x^6 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 6)) 1)
;Value: 1.259919377063932

;compute root of x^10 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 10)) 1)
;Quit!

;compute root of x^10 = 4 use 3 average damp
(fixed-point ((repeated average-damp 3) (f 4 10)) 1)
;Value: 1.1486996061210886

;compute root of x^9 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 9)) 1)
;Quit!

;compute root of x^8 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 8)) 1)
;Quit!

;compute root of x^7 = 4 use 2 average damp
(fixed-point ((repeated average-damp 2) (f 4 7)) 1)
;Value: 1.2190169347581832

;so second, third roots need 1 average damp
;fourth~seventh roots need 2 average damp
;eighth~tenth roots need 3 average damp
;nth roots need log2^n average damp

(define (nth-roots y n)
  (fixed-point 
	 ((repeated average-damp (floor (/ (log n) (log 2))))
	  (f y n))
	 1)
	)

;Value: nth-roots

(nth-roots 4 7)
;Value: 1.2190169347581832

(nth-roots 100 20)
;Value: 1.2589259524638758

(exp 1.2589259524638758 20)
;Value: 100.0008589419349

(nth-roots (* 1024 1024 1024) 30)
;Value: 2.0000044907654058

		       






