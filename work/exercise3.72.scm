(define (ramanujan3)
  (define (search s)
    (if (and (= (W (stream-car s)) (W (stream-car (stream-cdr s))))
	     (= (W (stream-car s)) (W (stream-car (stream-cdr (stream-cdr s))))))
	(cons-stream
	 (list (W (stream-car s)) (stream-car s) (stream-car (stream-cdr s)) (stream-car (stream-cdr (stream-cdr s))))
	 (search (stream-cdr (stream-cdr s)))
	 )
	(search (stream-cdr s))
	)
    )
  (search s)
  )
;Value: "ramanujan3 --> #[compound-procedure 21 ramanujan3]"

(stream-ref (ramanujan3) 0)
(87539319 (167 436) (228 423) (255 414)),
;it spent so much time to produce the first one, so I do not want to computer later numbers.
