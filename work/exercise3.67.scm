(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
     (pairs (stream-cdr s) (stream-cdr t)))
     (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
     )
   )
  )

(define ones (cons-stream 1 ones))
(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(stream-ref (pairs integers integers) 0)
;Value: (1 1)

(stream-ref (pairs integers integers) 1)
;Value: (1 2)

(stream-ref (pairs integers integers) 2)
;Value: (1 2)

(stream-ref (pairs integers integers) 3)
;Value: (2 2)

(stream-ref (pairs integers integers) 4)
;Value: (1 3)

(stream-ref (pairs integers integers) 5)
;Value: (1 3)

