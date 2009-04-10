; Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
;   Release 7.5.1
;   Microcode 11.165
;   Runtime 14.180
;   Edwin 3.99
;   6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-vect x y)
  (cons x y))
;Value: "make-vect --> #[compound-procedure 3 make-vect]"

(define (xcor-vect v)
  (car v))
;Value: "xcor-vect --> #[compound-procedure 4 xcor-vect]"

(define (ycor-vect v)
  (cdr v))
;Value: "ycor-vect --> #[compound-procedure 5 ycor-vect]"

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
		(xcor-vect v2))
	     (+ (ycor-vect v1)
		(ycor-vect v2))
	     )
  )
;Value: "add-vect --> #[compound-procedure 6 add-vect]"

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
		(xcor-vect v2))
	     (- (ycor-vect v1)
		(ycor-vect v2))
	     )
  )
;Value: "sub-vect --> #[compound-procedure 7 sub-vect]"

(define (scale-vect s v)
  (make-vect (* (xcor-vect v)
		s)
	     (* (ycor-vect v)
		s)
	     )
  )
;Value: "scale-vect --> #[compound-procedure 8 scale-vect]"