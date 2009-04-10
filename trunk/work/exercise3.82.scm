(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define (pred x)
  (<= (+ (square (- (car x) 5)) (square (- (cdr x) 7)))
     (square 3)
     )
  )

(define (square x) (* x x))

(define (estimate-integral pred x1 x2 y1 y2)
  (define infinite-stream (cons-stream (list x1 x2 y1 y2) infinite-stream))
  (let* ((random-pairs (stream-map (lambda (x) (cons (random-in-range (car x) (cadr x))
						     (random-in-range (caddr x) (cadddr x))))
				   infinite-stream))
	 (cesaro-stream (stream-map pred random-pairs)))
    (stream-map (lambda (x) (* (- x2 x1) (- y2 y1) x))
		(monte-carlo cesaro-stream 0 0))))

(* 3.1415926 (square 3))
;28.2743334

(stream-ref (estimate-integral pred 2 8 4 10) 100)
;Value: 27.44554455445545

(stream-ref (estimate-integral pred 2 8 4 10) 1000)
;Value: 26.3976023976024

(stream-ref (estimate-integral pred 2 8 4 10) 10000)
;Value: 27.03329667033297

; I can not use this definition.
(define random-1 (cons-stream (cons (random-in-range 2 8)
				      (random-in-range 4 10))
				random-1))


(test random-1 10)
(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),(3 . 7),

; this definition is not OK.
(test (let ((ones (cons-stream 1 ones)))
	ones) 10)
1,
;Unbound variable: ones
;Type D to debug error, Q to quit back to REP loop: q
;Quit!




