Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-interval a b) (cons a b))
;Value: "make-interval --> #[compound-procedure 2 make-interval]"

(define (lower-bound z) (car z))
;Value: "lower-bound --> #[compound-procedure 3 lower-bound]"

(define (upper-bound z) (cdr z))
;Value: "upper-bound --> #[compound-procedure 4 upper-bound]"

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: "mul-interval --> #[compound-procedure 5 mul-interval]"

(define (div-interval x y)
  (cond ((= (upper-bound y) 0)
	 (display "upper bound of divisor is 0!"))
	((= (lower-bound y) 0)
	 (display "lower bound of divisor is 0!"))
	(else (mul-interval x
			    (make-interval (/ 1.0 (upper-bound y))
					   (/ 1.0 (lower-bound y))
					   )
			    )
	      )
	)
  )
;Value: "div-interval --> #[compound-procedure 10 div-interval]"

(div-interval (make-interval 1 2) (make-interval 0 1))
lower bound of divisor is 0!
;Value: #[unspecified-return-value]

(div-interval (make-interval 1 2) (make-interval -1 0))
upper bound of divisor is 0!
;Value: #[unspecified-return-value]

(div-interval (make-interval 0 2) (make-interval 1 2))
;Value: (0. . 2.)

(div-interval (make-interval -1 0) (make-interval 1 2))
;Value: (-1. . 0.)




