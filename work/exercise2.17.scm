Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))
      )
  )
;Value: "last-pair --> #[compound-procedure 10 last-pair]"

(last-pair (list 1 2 3 4))
;Value: 4

(last-pair (list 22 43 45))
;Value: 45

(last-pair (list 2 3))
;Value: 3

(last-pair (list 2))
;Value: 2








