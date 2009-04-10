(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
		(stream-cdr (pairs t u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))
    )
   )
  )


(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define (square x) (* x x))

(define pythagorean 
  (stream-filter (lambda (x) (= (square (caddr x))
				(+ (square (car x)) (square (cadr x)))))
		 (triples integers integers integers)))

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

(test pythagorean 4)
(3 4 5),(6 8 10),(5 12 13),(9 12 15),
;Value: done
; If I need it produce more values, it run out of memory, I think my method is right.
(test (triples integers integers integers) 50)
(1 1 1),(1 1 2),(2 2 2),(1 2 2),(2 2 3),(1 1 3),(3 3 3),(1 2 3),(2 3 3),(1 1 4),(3 3 4),(1 3 3),(2 2 4),(1 1 5),(4 4 4),(1 2 4),(2 3 4),(1 1 6),(3 4 4),(1 3 4),(2 2 5),(1 1 7),(4 4 5),(1 2 5),(2 4 4),(1 1 8),(3 3 5),(1 4 4),(2 2 6),(1 1 9),(5 5 5),(1 2 6),(2 3 5),(1 1 10),(3 4 5),(1 3 5),(2 2 7),(1 1 11),(4 5 5),(1 2 7),(2 4 5),(1 1 12),(3 3 6),(1 4 5),(2 2 8),(1 1 13),(5 5 6),(1 2 8),(2 3 6),(1 1 14),
;Value: done

