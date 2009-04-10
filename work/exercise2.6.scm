Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define zero (lambda (f) (lambda (x) x)))
;Value: "zero --> #[compound-procedure 2 zero]"

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;Value: "add-1 --> #[compound-procedure 4 add-1]"

(define one
  (lambda (f) (lambda (x) (f x)))
  )
;Value: "one --> #[compound-procedure 6 one]"

(define two
  (lambda (f) (lambda (x) (f (f x))))
  )
;Value: "two --> #[compound-procedure 11 two]"

;below code is copyed from code17 in CSDN
(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))
;Value: "add --> #[compound-procedure 22 add]"

(define (cn-to-n cn) ((cn (lambda (i) (+ i 1))) 0))
;Value: "cn-to-n --> #[compound-procedure 13 cn-to-n]"

(define (n-to-cn n)
  (if (= n 0)
      (lambda (f) (lambda (x) x))
      (add-1 (n-to-cn (- n 1)))))
;Value: "n-to-cn --> #[compound-procedure 14 n-to-cn]"

(cn-to-n one)
;Value: 1

(cn-to-n two)
;Value: 2

(define five (add-1 (add-1 (add-1 two))))
;Value: "five --> #[compound-procedure 16]"

(cn-to-n five)
;Value: 5

(define seven (n-to-cn 7))
;Value: "seven --> #[compound-procedure 17]"

(cn-to-n seven)
;Value: 7

(define twelve (add five seven))
;Value: "twelve --> #[compound-procedure 23]"

(cn-to-n twelve)
;Value: 12

(zero one)




