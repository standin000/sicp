(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))

(define integers (cons-stream 1 (add-streams ones integers)))

(define ones (cons-stream 1 ones))

(stream-ref factorials 0)
;Value: 1

(stream-ref factorials 1)
;Value: 2

(stream-ref factorials 2)
;Value: 6

(stream-ref factorials 3)
;Value: 24

(stream-ref factorials 7)
;Value: 40320