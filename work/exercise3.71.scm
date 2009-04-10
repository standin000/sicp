(define (cube x) (* x x x))
;Value: "cube --> #[compound-procedure 13 cube]"

(define W 
   (lambda (e) 
     (+ (cube (car e)) (cube (cadr e)))))
;Value: "w --> #[compound-procedure 15 w]"

(define s
  (weighted-pairs 
   integers 
   integers 
   W
   )
  )
;Value: "s --> ((1 1) . #[promise 16])"

(define (ramanujan)
  (define (search s)
    (if (= (W (stream-car s)) (W (stream-car (stream-cdr s))))
	(cons-stream
	 (W (stream-car s))
	 (search (stream-cdr (stream-cdr s)))
	 )
	(search (stream-cdr s))
	)
    )
  (search s)
  )
;Value: "ramanujan --> #[compound-procedure 19 ramanujan]"

(stream-ref (ramanujan) 0)
;Value: 1729

(test (ramanujan) 5)
1729,4104,13832,20683,32832,
;Value: done
