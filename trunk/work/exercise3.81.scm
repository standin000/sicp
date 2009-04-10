(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define (rand request-stream initial-value last-value)
  (let ((s (stream-car request-stream)))
    (cond ((eq? s 'generate) 
	   (let ((x (rand-update last-value)))
	     (cons-stream x
			  (rand (stream-cdr request-stream) initial-value x))
	     )
	   )
	  ((eq? s 'reset)
	   (cons-stream 'ok
			(rand (stream-cdr request-stream) initial-value initial-value)))
	  (else (error "Error Request!"))
	  )
    )
  )

(define request-stream (list->stream (list 'generate 'generate 'generate 'generate 'generate 'reset 'generate 'generate 'generate 'generate)))

(test (rand request-stream 0 0) 10)
26,93,124,72,65,ok,26,93,124,72,
;Value: done
