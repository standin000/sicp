Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (count-leaves t)
  (accumulate
   (lambda (x y)
     (+ x y)
     )
   0
   (map (lambda (x)
	  (if (pair? x)
	      (if (pair? (car x))
		  (+ (count-leaves (car x)) (count-leaves (cdr x)))
		  (+ 1 (count-leaves (cdr x)))
		  )
	      1)
	  )
	t)))
;Value: "count-leaves --> #[compound-procedure 11 count-leaves]"

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 4 accumulate]"

(count-leaves (list 0 (list 1 2 (list 3 4))))
;Value: 5

(define x (cons (list 1 2) (list 3 4)))
;Value: "x --> ((1 2) 3 4)"

(count-leaves x)
;Value: 4

(count-leaves (list x x))
;Value: 8

(count-leaves '(1))
;Value: 1




