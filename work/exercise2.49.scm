; Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
;   Release 7.5.1
;   Microcode 11.165
;   Runtime 14.180
;   Edwin 3.99
;   6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define outline
  (segments->painter
    (list (make-segment (make-vect 0 0) (make-vect 0 10))
	  (make-segment (make-vect 0 0) (make-vect 10 0))
	  (make-segment (make-vect 10 0) (make-vect 10 10))
	  (make-segment (make-vect 0 10) (make-vect 10 10))
	  )
    )

  )

(outline
 (make-frame (make-vect 100 100) (make-vect 0 50) (make-vect 50 0)))

(define X
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 10 10))
	 (make-segment (make-vect 0 10) (make-vect 10 0))
	 )
   )
  )

(X (make-frame (make-vect 150 150) (make-vect 0 50) (make-vect 50 0)))

(define diamond
  (segments->painter
   (list (make-segment (make-vect 0 5) (make-vect 5 10))
	 (make-segment (make-vect 5 10) (make-vect 10 5))
	 (make-segment (make-vect 10 5) (make-vect 5 0))
	 (make-segment (make-vect 5 0) (make-vect 0 5))
	 )
   )
  )

(diamond (make-frame (make-vect 200 200) (make-vect 0 50) (make-vect 50 0)))

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

(wave (make-frame (make-vect 250 250) (make-vect 0 100) (make-vect 100 0)))


