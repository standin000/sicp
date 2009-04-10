Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (reverse l)
  (if (null? (cdr l))
      (cons (car l) nil)
      (append (reverse (cdr l)) (cons (car l) nil)
      )
  )
)
;Value: "reverse --> #[compound-procedure 12 reverse]"

(reverse (list 1 2 3 4))
;Value: (4 3 2 1)





















