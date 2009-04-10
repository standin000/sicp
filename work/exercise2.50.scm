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

(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 10 0) ; new origin
		     (make-vect 0 0) ; new end of edge1
		     (make-vect 10 10))) ; new end of edge2
(define (rotate180 painter)
  (transform-painter painter
		     (make-vect 10 10) ; new origin
 		     (make-vect 0 10) ; new end of edge1
 		     (make-vect 10 0))) ; new end of edge2
		     
(define (rotate270 painter)
  (transform-painter painter
		     (make-vect 0 10) ; new origin
		     (make-vect 0 0) ; new end of edge1
		     (make-vect 10 10))) ; new end of edge2

((flip-horiz wave)
   (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))
((rotate180 wave)
   (make-frame (make-vect 100 0) (make-vect 0 100) (make-vect 100 0)))
((rotate270 wave)
    (make-frame (make-vect 0 100) (make-vect 0 100) (make-vect 100 0)))

;note: edge1 is used for x-coordinate, edge2 is used for y-coordinate.