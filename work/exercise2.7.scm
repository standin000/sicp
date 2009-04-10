Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-interval a b) (cons a b))
;Value: "make-interval --> #[compound-procedure 2 make-interval]"

(define (lower-bound z) (cdr z))
;Value: "lower-bound --> #[compound-procedure 3 lower-bound]"

(define (upper-bound z) (cdr z))
;Value: "upper-bound --> #[compound-procedure 4 upper-bound]"