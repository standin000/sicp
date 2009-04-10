Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (cons a b)
  (*
   (product 2 a)
   (product 3 b)
   )
  )
;Value: "cons --> #[compound-procedure 3 cons]"

(define (product x y)
  (cond 
   ((= y 0) 1)
   ((= y 1) x)
   (else (* x (product x (- y 1))))
   )
  )
;Value: "product --> #[compound-procedure 10 product]"

(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0
      )
  )
;Value: "car --> #[compound-procedure 5 car]"

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0
      )
  )
;Value: "cdr --> #[compound-procedure 6 cdr]"

(car (cons 2 3))
;Value: 2

(cdr (cons 2 3))
;Value: 3

(car (cons 6 7))
;Value: 6

(cdr (cons 6 7))
;Value: 7

(car (cons 0 8))
;Value: 0

(cdr (cons 0 8))
;Value: 8

(car (cons 1 8))
;Value: 1

(cdr (cons 1 8))
;Value: 8

(car (cons 2 10))
;Value: 2

(cdr (cons 2 10))
;Value: 10






