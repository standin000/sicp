Scheme saved on Saturday January 29, 2000 at 8:21:45 PM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Win32 1.5
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-segment x y)
  (cons x y))
;Value: "make-segment --> #[compound-procedure 3 make-segment]"


(define (start-segment z)
  (car z))
;Value: "start-segment --> #[compound-procedure 4 start-segment]"

(define (end-segment z)
  (cdr z))
;Value: "end-segment --> #[compound-procedure 12 end-segment]"

(define (make-point x y)
  (cons x y))
;Value: "make-point --> #[compound-procedure 6 make-point]"

(define (x-point z)
  (car z))
;Value: "x-point --> #[compound-procedure 7 x-point]"

(define (y-point z)
  (cdr z))
;Value: "y-point --> #[compound-procedure 8 y-point]"

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;Value: "print-point --> #[compound-procedure 13 print-point]"

(define (midpoint-segment z)
  (let ((x (average (x-point (start-segment z)) (x-point (end-segment z))))
	(y (average (y-point (start-segment z)) (y-point (end-segment z)))))
    (make-point x y)))
;Value: "midpoint-segment --> #[compound-procedure 10 midpoint-segment]"

(define (average x y)
  (/ (+ x y) 2))
;Value: "average --> #[compound-procedure 11 average]"

(define a (make-segment (make-point 0 0) (make-point 4 4)))
;Value: "a --> ((0 . 0) 4 . 4)"

(print-point (midpoint-segment a))

(2,2)
;Value: #[unspecified-return-value]







