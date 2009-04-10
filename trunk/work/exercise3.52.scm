(define (display-stream s)
  (stream-for-each display-line s))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
			 seq))
(stream-ref y 7)
;Value: 136

(display sum)
;136
;Value: #[unspecified-return-value]

(display-stream z)
;10
;15
;45
;55
;105
;120
;190
;210
;Value: #[unspecified-return-value]

(display sum)
;210
;Value: #[unspecified-return-value]

; if we had implemented (delay <exp>) simply as (lambda () <exp>)
; without using the optimization provided by memo-proc ?, after
; evaluating (stream-ref y 7), sum is 137 and it will be 347 after
; evaluating (display-stream z). Because whenever visit a element of
; z, accum will be executed again and again. 

