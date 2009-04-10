#it seems guile does not support stream operations.

(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map  stream-car argstreams))
       (apply stream-map
	      (cons proc (map stream-cdr argstreams))))))

(stream-map 
  (lambda (e) (+ e 1))
  (cons-stream 1 2))
;Value: (2 . #[promise 7])

(stream-map 
  (lambda (e1 e2) (+ e1 e2))
  (cons-stream 1 2)
  (cons-stream 3 4))
;Value: (4 . #[promise 8])
  


