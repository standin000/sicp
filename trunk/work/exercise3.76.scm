(define (smooth input-stream)
  (define (inner-smooth input-stream last-value)
    (cons-stream (/ (+ (stream-car input-stream) last-value) 2)
		 (inner-smooth (stream-cdr input-stream) (stream-car input-stream)))
    )
  (inner-smooth input-stream 0)
  )


(define (make-zero-crossings input-stream last-value)
  (cons-stream
   (sign-change-detector (stream-car input-stream) last-value)
   (make-zero-crossings (stream-cdr input-stream)
			(stream-car input-stream))))


(define zero-crossings (make-zero-crossings (smooth sense-data) 0)

(test zero-crossings 13)
0,0,0,0,0,0,-1,0,0,0,0,1,0,
;Value: done

