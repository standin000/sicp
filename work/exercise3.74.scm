(define (make-zero-crossings input-stream last-value)
  (cons-stream
   (sign-change-detector (stream-car input-stream) last-value)
   (make-zero-crossings (stream-cdr input-stream)
			(stream-car input-stream))))

(define sense-data (list->stream (list 1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))

(define (sign-change-detector new old)
  (if (and (< old 0) (>= new 0))
      1
      (if (and (>= old 0) (< new 0))
	  -1
	  0)
      )
  )

(define zero-crossings (make-zero-crossings sense-data 0))

(test zero-crossings 13)
0,0,0,0,0,-1,0,0,0,0,1,0,0,
;Value: done

(define zero-crossings
  (stream-map sign-change-detector sense-data (cons-stream 0 sense-data)))

(test zero-crossings 13)
0,0,0,0,0,-1,0,0,0,0,1,0,0,
;Value: done
