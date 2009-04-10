(define (merge-weighted s1 s2 W)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (cond ((<= (W s1car) (W s2car))
		  (cons-stream s1car (merge-weighted (stream-cdr s1) s2 W)))
		 ((> (W s1car) (W s2car))
		  (cons-stream s2car (merge-weighted s1 (stream-cdr s2) W)))
		 (else
		  (cons-stream s1car
			       (merge-weighted (stream-cdr s1)
					       (stream-cdr s2)
					       W))))))))
;;I try to solve this problem without limit in comment 69 of Chapter 3, it wastes much time!
(define (weighted-pairs s t W)
  (cons-stream
   (list (stream-car s) (stream-car t))
  (merge-weighted
   (cons-stream (list (stream-car s) (stream-car (stream-cdr t))) '())
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr (stream-cdr t)))
    (weighted-pairs (stream-cdr s) (stream-cdr t) W)
    W
    )
   W
   )
  )
  )

(define a (weighted-pairs integers integers (lambda (e) (+ (car e) (cadr e)))))
;Value: "a --> ((1 1) . #[promise 8])"

(define (test s n)
  (define (inner-test k)
    (if (< k n)
	(begin
	  (display (stream-ref s k))
	  (display ",")
	  (inner-test (+ k 1))
	  )
	'done
	)
    )
  (inner-test 0)
  )
;Value: "test --> #[compound-procedure 7 test]"

(test a 30)
(1 1),(1 2),(1 3),(2 2),(1 4),(2 3),(1 5),(2 4),(3 3),(1 6),(2 5),(3 4),(1 7),(2 6),(3 5),(4 4),(1 8),(2 7),(3 6),(4 5),(1 9),(2 8),(3 7),(4 6),(5 5),(1 10),(2 9),(3 8),(4 7),(5 6),
;Value: done

(define b (weighted-pairs
	   (stream-filter (lambda (e) (not (or (= (remainder e 5) 0)
							(= (remainder e 3) 0)
							(= (remainder e 3) 0))))
			  integers
			  )

	   (stream-filter (lambda (e) (not (or (= (remainder e 5) 0)
							(= (remainder e 3) 0)
							(= (remainder e 3) 0))))
			  integers
			  )

	   (lambda (e) 
	     (let ((i (car e))
		   (j (cadr e)))
	     (+ (* 2 i) (* 3 j) (* 5 i j))
	     )
	     )
	   )
  )
;Value: "b --> ((1 1) . #[promise 11])"

(test b 30)
(1 1),(1 2),(2 2),(1 4),(2 4),(1 7),(1 8),(1 11),(2 7),(4 4),(1 13),(2 8),(1 14),(1 16),(1 17),(2 11),(1 19),(4 7),(2 13),(1 22),(1 23),(2 14),(4 8),(1 26),(2 16),(2 17),(1 28),(1 29),(1 31),(2 19),



