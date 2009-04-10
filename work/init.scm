(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame) (start-segment segment))
	((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;Because I can not use SCM_NUM2DBL(covert SCM object to float in C)
;in guile now, I use (0 0 10 10) for unit square.
;so here I need minimize the vecter which is maximized
;why not use scale-vect for it will convert integer to float.

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (mini-vect 10
		(add-vect (scale-vect (xcor-vect v)
				      (edge1-frame frame))
			  (scale-vect (ycor-vect v)
				      (edge2-frame frame)))))))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-segment v1 v2)
  (cons v1 v2)
  )

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
		(xcor-vect v2))
	     (+ (ycor-vect v1)
		(ycor-vect v2))
	     )
  )

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
		(xcor-vect v2))
	     (- (ycor-vect v1)
		(ycor-vect v2))
	     )
  )

(define (mini-vect s v)
  (make-vect (/ (xcor-vect v)
		s)
	     (/ (ycor-vect v)
		s)
	     )
  )
(define (scale-vect s v)
  (make-vect (* (xcor-vect v)
		s)
	     (* (ycor-vect v)
		s)
	     )
  )

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f)
  (car f))

(define (edge1-frame f)
  (cadr f))

(define (edge2-frame f)
  (caddr f))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
	(painter
	 (make-frame new-origin
		     (sub-vect (m corner1) new-origin)
		     (sub-vect (m corner2) new-origin)))))))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 5 0)))
    (let ((paint-left
	   (transform-painter painter1
			      (make-vect 0 0)
			      split-point
			      (make-vect 0 10)))
	  (paint-right
	   (transform-painter painter2
			      split-point
			      (make-vect 10 0)
			      (make-vect 5 10))))
      (lambda (frame)
	(paint-left frame)
	(paint-right frame)))))

(define (rotate90 painter)
  (transform-painter painter
		     (make-vect 10 0)
		     (make-vect 10 10)
		     (make-vect 0 0)
		     )
  )

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))

(define (flip-vert painter)
  (transform-painter painter
		     (make-vect 0 10) ; new origin
		     (make-vect 10 10) ; new end of edge1
		     (make-vect 0 0))) ; new end of edge2

(define (identity x) x)

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1))))
	(let ((top-left (beside up up))
	      (bottom-right (below right right))
	      (corner (corner-split painter (- n 1))))
	  (beside (below painter top-left)
		  (below bottom-right corner))))))