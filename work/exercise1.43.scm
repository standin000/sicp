Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (compose f g)
  (lambda (x)
    (f (g x))
    )
  )
;Value: "compose --> #[compound-procedure 2 compose]"

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))
      )
  )
;Value: "repeated --> #[compound-procedure 4 repeated]"

((repeated square 2) 5)
;Value: 625

((repeated inc 2) 5)
;Value: 7

