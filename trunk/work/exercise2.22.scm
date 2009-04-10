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
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items nil))
;Value: "square-list --> #[compound-procedure 3 square-list]"

(square-list (list 1 2 3 4))
;Value: (16 9 4 1)
;It is because the first element of items is put into answer first, and the
;cons will put it in the last element of new answer list.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items nil))
;Value: "square-list --> #[compound-procedure 4 square-list]"

(square-list (list 1 2 3 4))
;Value: ((((#f . 1) . 4) . 9) . 16)

;It is because nil is consed first and it form a list.
;The right answer is: expression from exercise2.18

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (append answer
		    (cons (square (car things)) nil)))))
  (iter items nil))
;Value: "square-list --> #[compound-procedure 8 square-list]"

(square-list (list 1 2 3 4))
;Value: (1 4 9 16)









