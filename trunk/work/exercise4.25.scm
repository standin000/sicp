(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1)
	  (* n (factorial (- n 1)))
	  1))

(factorial 5)
;EXCEPTION: stack-overflow (#f "Stack overflow" #f #f)
; => unhandled-exception-in-evaluation
; It is because it will execute (factorial 0) first when n == 1
; and it causes endless loop. It works in a normal-order language
; for (factorial 0) is not executed.



