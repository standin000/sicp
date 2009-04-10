Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
;Value: "map --> #[compound-procedure 3 map]"

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
;Value: "append --> #[compound-procedure 6 append]"

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 5 accumulate]"

(map square (list 1 2 3 4))
;Value: (1 4 9 16)

(append (list 1 2) (list 3 4))
;Value: (1 2 3 4)

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1))  0 sequence))
;Value: length

(length (list 1 2 3 4 6 9))
;Value: 6
