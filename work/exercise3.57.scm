(define fibs
  (cons-stream 0
	       (cons-stream 1
			    (add-streams (stream-cdr fibs)
					 fibs))))
(define count 0)

(define (add-streams s1 s2)
  (stream-map
   (lambda (e1 e2) (set! count (+ count 1)) (+ e1 e2))
   s1 s2))

(define (test n)
  (display (stream-ref fibs n))
  (newline)
  (display count)
  )


(test 0)
0
0
;Value: #[unspecified-return-value]

(test 1)
1
0
;Value: #[unspecified-return-value]

(test 2)
1
1
;Value: #[unspecified-return-value]

(test 3)
2
2
;Value: #[unspecified-return-value]

(test 4)
3
3
;Value: #[unspecified-return-value]

(test 5)
5
4
;Value: #[unspecified-return-value]

(test 6)
8
5
;Value: #[unspecified-return-value]


;if we had implemented (delay <exp>) simply as (lambda () <exp>)
; fib(0) need 0 time addtion.
; fib(1) need 0 time addtion.
; fib(2) need 1 time addtion.
; fib(3) need 2 time addtions.
; fib(4) need 5 time addtions.
; fib(n) need Sigma(count(fib(n-1))) + Sigma(count(fib(n-2))) + 1 time addtions.
; so count(fib(n)) is a array like Fibonacci, and it grow exponentially with n.
