(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
	       t)
   (pairs (stream-cdr s) (stream-cdr t))))

(stream-ref (pairs integers integers) 0)
;Aborting!: maximum recursion depth exceeded

;; It is because interleave of pairs is a not lazy procedure, it's parameters need be evaluated 
;; in the first, and its second parameters contains pair procedure. so it is a->b->a->b... loop
;; process.

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave (force s2) (delay (stream-cdr s1))))))

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
	       t)
   (delay (pairs (stream-cdr s) (stream-cdr t)))))


(stream-ref (pairs integers integers) 0)
;Value: (1 1)

(stream-ref (pairs integers integers) 1)
;Value: (2 2)

(stream-ref (pairs integers integers) 2)
;Value: (1 2)

(stream-ref (pairs integers integers) 3)
;Value: (3 3)

(stream-ref (pairs integers integers) 4)
;Value: (1 3)






