(define s (cons-stream 1 (add-streams s s)))
;=>   1 2 4 8...              s
;     1 2 4 8...              s
;   1 2 4 8 16...             s

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(stream-ref s 0)
;Value: 1

(stream-ref s 1)
;Value: 2

(stream-ref s 2)
;Value: 4

(stream-ref s 6)
;Value: 64
