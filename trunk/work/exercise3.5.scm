(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral pred x1 x2 y1 y2 trials)
  (let ((counter 0))
    (define (estimate-integral-helper)
      (let ((x (random-in-range x1 x2))
	    (y (random-in-range y1 y2)))
	(if (pred x y)
	    (set! counter (+ counter 1))
	    )
	)
      )
    (monte-carlo trials estimate-integral-helper)
    (* (- x2 x1) (- y2 y1) (/ counter trials))
    )
  )

(define (square x) (* x x))

(define (pred x y)
  (<= (+ (square (- x 5)) (square (- y 7)))
     (square 3)
     )
  )
(* 3.1415926 (square 3))
;28.2743334

(estimate-integral pred 2 8 4 10 100)
;28.44

(estimate-integral pred 2 8 4 10 1000)
;26.82

(estimate-integral pred 2 8 4 10 10000)
;27.3816

(estimate-integral pred 2 8 4 10 100000)
;27.072