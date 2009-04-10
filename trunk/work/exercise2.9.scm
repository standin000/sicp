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
;Value: "lower-bound --> #[compound-procedure 10 lower-bound]"

(define (upper-bound z) (cdr z))
;Value: "upper-bound --> #[compound-procedure 4 upper-bound]"

(define (width-of-interval z)
  (/
    (- (upper-bound z) (lower-bound z))
   2)
  )
;Value: "width-of-interval --> #[compound-procedure 13 width-of-interval]"

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))
;Value: "add-interval --> #[compound-procedure 8 add-interval]"

(width-of-interval (add-interval (make-interval 1 2) (make-interval 3 4)))
;Value: 1

(+ (width-of-interval (make-interval 1 2))
   (width-of-interval (make-interval 3 4)))
;Value: 1.

;To prove
;(width-of-interval (add-interval x y))
;=>(width-of-interval ((make-interval (+ (lower-bound x) (lower-bound y))
;   (+ (upper-bound x) (upper-bound y)))))
;=>(/
;   (- (+ (upper-bound x) (upper-bound y))
;      (+ (lower-bound x) (lower-bound y)))
;   2)
;=>(+
;   (/
;    (- (upper-bound x) (lower-bound x)
;    2)
;   (/
;    (- (upper-bound y) (lower-bound y)
;    2)
;  )
;=>(+ (width-of-interval x) (width-of-interval y)

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound x))
		 (- (upper-bound y) (lower-bound y))))
;Value: "sub-interval --> #[compound-procedure 14 sub-interval]"

(width-of-interval (sub-interval (make-interval 1 2) (make-interval 3 4)))
;Value: 0

(- (width-of-interval (make-interval 1 2))
   (width-of-interval (make-interval 3 4)))
;Value: 0.

;To prove
;(width-of-interval (sub-interval x y))
;=>(width-of-interval ((make-interval (+ (upper-bound x) (lower-bound x))
;   (+ (upper-bound y) (lower-bound y)))))
;=>(/
;   (- (+ (upper-bound y) (lower-bound y))
;      (+ (upper-bound x) (lower-bound x)))
;   2)
;=>(-
;   (/
;    (- (upper-bound y) (lower-bound y)
;    2)
;   (/
;    (- (upper-bound x) (lower-bound x)
;    2)
;  )
;=>(- (width-of-interval x) (width-of-interval y)

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: "mul-interval --> #[compound-procedure 15 mul-interval]"

(width-of-interval (mul-interval (make-interval 1 2) (make-interval 3 4)))
;Value: 2.5

(* (width-of-interval (make-interval 1 2))
   (width-of-interval (make-interval 3 4)))
;Value: .25

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))
;Value: "div-interval --> #[compound-procedure 16 div-interval]"

(width-of-interval (div-interval (make-interval 1 2) (make-interval 3 4)))
;Value: .20833333333333331

(/ (width-of-interval (make-interval 1 2))
   (width-of-interval (make-interval 3 4)))
;Value: 1.









