Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (cons x y)
  (lambda (m) (m x y)))
;Value: "cons --> #[compound-procedure 3 cons]"

(define (car z)
  (z (lambda (p q) p)))
;Value: "car --> #[compound-procedure 4 car]"

(car (cons 1 2))
;Value: 1

(define (cdr z)
  (z (lambda (p q) q)))
;Value: "cdr --> #[compound-procedure 5 cdr]"

(cdr (cons 1 2))
;Value: 2

