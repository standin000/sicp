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
	 (make-segment (make-vect 2 3)
	       (make-vect 2 4))
	 (make-segment (make-vect 2 6)
	       (make-vect 2 7))
	 (make-segment (make-vect 3 4)
	       (make-vect 3 6))
	 )
   )
  )

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

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(below painter (beside smaller smaller)))))

(define (rotate180 painter)
  (transform-painter painter
		     (make-vect 10 10) ; new origin
 		     (make-vect 0 10) ; new end of edge1
 		     (make-vect 10 0))) ; new end of edge2

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
	  (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 10 0) ; new origin
		     (make-vect 0 0) ; new end of edge1
		     (make-vect 10 10))) ; new end of edge2


(define (conner-split painter n)
  (let ((up (up-split painter (- n 1)))
        (right (right-split painter (- n 1)))
        (corner (corner-split painter (- n 1))))
    (beside (below painter up)
            (below right corner))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
				  flip-vert rotate180)))
    (combine4 (corner-split painter n))))

((conner-split wave 1)
 (make-frame (make-vect 0 0) (make-vect 0 500) (make-vect 500 0)))

((square-limit wave 0)
  (make-frame (make-vect 0 0) (make-vect 0 500) (make-vect 500 0)))


