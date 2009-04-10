; Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
;   Release 7.5.1
;   Microcode 11.165
;   Runtime 14.180
;   Edwin 3.99
;   6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (split op1 op2)
  (define (split-r painter n)
    (if (= n 0)
      painter
      (let ((smaller (split-r painter (- n 1))))
	(op1 painter (op2 smaller smaller)))))
  split-r)
;Value: "split --> #[compound-procedure 3 split]"

(define (below painter1 painter2)
  (let ((split-point (make-vect 0 5)))
    (let ((paint-left
	   (transform-painter painter1
			      (make-vect 0 0)
			      (make-vect 10 0)
			      split-point
			      ))
	  (paint-right
	   (transform-painter painter2
			      split-point
			      (make-vect 10 5)
			      (make-vect 0 10)
			      )))
      (lambda (frame)
	(paint-left frame)
	(paint-right frame)))))

(define wave 
  (segments->painter 
   (list (make-segment (make-vect 0 6)
	       (make-vect 2 7))
	 (make-segment (make-vect 2 7)
	       (make-vect 4 6))
	 (make-segment (make-vect 4 6)
	       (make-vect 6 10))
	 (make-segment (make-vect 6 6)
	       (make-vect 8 10))
	 (make-segment (make-vect 6 6)
	       (make-vect 10 7))
	 (make-segment (make-vect 7 5)
	       (make-vect 10 6))
 	 (make-segment (make-vect 7 5)
	       (make-vect 10 4))
	 (make-segment (make-vect 10 3)
	       (make-vect 6 4))
	 (make-segment (make-vect 6 4)
	       (make-vect 5 3))
	 (make-segment (make-vect 5 3)
	       (make-vect 6 2))
	 (make-segment (make-vect 6 2)
	       (make-vect 4 0))
	 (make-segment (make-vect 4 4)
	       (make-vect 5 2))
	 (make-segment (make-vect 5 2)
	       (make-vect 2 0))
	 (make-segment (make-vect 4 4)
	       (make-vect 2 3))
	 (make-segment (make-vect 2 3)
	       (make-vect 0 4))
	 )
   )
  )


(((split beside below) wave 1)
 (make-frame (make-vect 0 0) (make-vect 0 500) (make-vect 500 0)))

