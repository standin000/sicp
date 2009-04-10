(define (make-zero-crossings input-stream last-value last-avpt)
  (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
    (cons-stream (sign-change-detector avpt last-avpt)
		 (make-zero-crossings (stream-cdr input-stream)
				      (stream-car input-stream)
				      avpt))))


(define zero-crossings (make-zero-crossings sense-data 0 0))

(test zero-crossings 13)
0,0,0,0,0,0,-1,0,0,0,0,1,0,
;Value: done
