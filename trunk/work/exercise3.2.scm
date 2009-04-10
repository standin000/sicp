(define (make-monitored f)
  (let ((counter 0))
    (lambda (i)
      (cond ((eq? i 'how-many-calls?) counter)
	    ((eq? i 'reset-count) (set! counter 0))
	    (else (set! counter (+ counter 1)) (f i))
	    )
      )
    )
  )

(define s (make-monitored sqrt))

(s 100)
; 10.0

(s 'how-many-calls?)
; 1

(s 9)
; 3.0

(s 'how-many-calls?)
; 2

(s 'reset-count)

(s 'how-many-calls?)
; 0

(s 81)
; 9.0

(s 'how-many-calls?)
; 1