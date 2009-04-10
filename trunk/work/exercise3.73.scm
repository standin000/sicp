(define (RC R C dt)
  (lambda (i v0)
    (add-streams
     (scale-stream i R)
     (integral (scale-stream i (/ 1 C)) v0 dt))
    )
  )

(define RC1 (RC 5 1 0.5))

(define ones (cons-stream 1 ones))

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

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
		 (add-streams (scale-stream integrand dt)
			      int)))
  int)

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(test (RC1 ones 0) 10)
5,5.5,6.,6.5,7.,7.5,8.,8.5,9.,9.5,
;Value: done


