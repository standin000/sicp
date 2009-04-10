Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))
      )
  )
;Value: "square-list --> #[compound-procedure 3 square-list]"

(square-list (list 1 2 3 4))
;Value: (1 4 9 16)

(define (square-list items)
  (map square items))
;Value: "square-list --> #[compound-procedure 6 square-list]"

(square-list (list 1 2 3 4))
;Value: (1 4 9 16)



