(define (RLC R L C dt)
  (lambda (Vc0 iL0)
    (define Vc (integral (delay dVc) vc0 dt))
    (define iL (integral (delay diL) iL0 dt))
    (define dVc (scale-stream iL (/ -1 C)))
    (define diL (add-streams
		 (scale-stream iL (/ (* -1 R) L))
		 (scale-stream Vc (/ 1 L))))
    (cons Vc iL)
    )
  )

(define series-RLC (RLC 1 0.2 1 0.1))

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

(test (car (series-RLC 10 0)) 10)
10,10,9.5,8.75,7.9,7.0375000000000005,6.211250000000001,5.446250000000001,4.753187500000001,4.134343750000001,
;Value: done

(test (cdr (series-RLC 10 0)) 10)
0,5.,7.5,8.5,8.625,8.2625,7.6499999999999995,6.930624999999999,6.1884375,5.470812500000001,
;Value: done



