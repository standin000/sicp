;reference http://www.kahua.org/download/sicp/ex-3.6.scm
;I think it is difficult to invent a perfect rand-update.
(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))
;; lambda sentence must be behind let sentence, so x is high level variables
;; than procedure rand.
(define rand
  (let ((x 0))
    (lambda (s)
      (cond ((eq? s 'generate) 
	     (set! x (rand-update x))
	     x)
	    ((eq? s 'reset)
	     (lambda (random-init)
	       (set! x random-init)
	       )
	     )
	    (else (error "Error Request!"))
	    )
      )
    )
  )

((rand 'reset) 4)

(rand 'generate)
; 7

(rand 'generate)
; 88

(rand 'generate)
; 116

((rand 'reset) 4)

(rand 'generate)
; 7

(rand 'generate)
; 88

(rand 'generate)
; 116
