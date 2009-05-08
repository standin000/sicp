;(define x 10)

;(define s (make-serializer))

;(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
;		  (s (lambda () (set! x (+ x 1)))))

; $101, $121 is no problem and $100 is because first set! operation is not included
; into serializer