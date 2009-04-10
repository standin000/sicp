(define (make-accumulator initial)
  (lambda (n)
    (set! initial (+ initial n))
    initial
    )
  )

(define A (make-accumulator 5))

(A 10)
; 15

(A 10)
; 25

(A 30)
; 55