Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (double f)
  (lambda (x)
    (f (f x))))
;Value: "double --> #[compound-procedure 3 double]"

((double inc) 3)
;Value: 5

(((double (double double)) inc) 5)
;Value: 21

((double ((double double) inc)) 5)
;Value: 13

;=>(((double double) ((double double) inc)) 5) 
;(define quadruple (double double))
;=>((quadruple (quadruple inc)) 5)
;=>(inc 5) 16times.







