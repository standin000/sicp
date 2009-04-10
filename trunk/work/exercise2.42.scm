Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 7 accumulate]"

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
;Value: "flatmap --> #[compound-procedure 8 flatmap]"

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;Value: "enumerate-interval --> #[compound-procedure 10 enumerate-interval]"

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: "filter --> #[compound-procedure 11 filter]"


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
;Value: "queens --> #[compound-procedure 3 queens]"

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row))
  )
;Value: "adjoin-position --> #[compound-procedure 21 adjoin-position]"

(define empty-board nil)
;Value: "empty-board --> #f"

(define (safe? k positions)
  (define (safe-two-position r1 c1 r2 c2)
    (not
     (or
      (= c1 c2)
      (= (- r1 r2) (abs (- c1 c2)))
      )
     )
    )
  (define (safe-n? n)
    (or (= n 0)
	(and
	 (safe-two-position (- k 1) (list-ref positions (- k 1))
			    (- n 1) (list-ref positions (- n 1)))
	 (safe-n? (- n 1))
	 )
     )
    )
  (safe-n? (- k 1))
  )
;Value: "safe? --> #[compound-procedure 23 safe?]"

(queens 3)
;Value: #f

(length (queens 8))
;Value: 92

(queens 8)
;Value: ((1 5 8 6 3 7 2 4) (1 6 8 3 7 4 2 5) (1 7 4 6 8 2 5 3) (1 7 5 8 2 4 6 3) (2 4 6 8 3 1 7 5) (2 5 7 1 3 8 6 4) (2 5 7 4 1 8 6 3) (2 6 1 7 4 8 3 5) (2 6 8 3 1 4 7 5) (2 7 3 6 8 5 1 4) (2 7 5 8 1 4 6 3) (2 8 6 1 3 5 7 4) (3 1 7 5 8 2 4 6) (3 5 2 8 1 7 4 6) (3 5 2 8 6 4 7 1) (3 5 7 1 4 2 8 6) (3 5 8 4 1 7 2 6) (3 6 2 5 8 1 7 4) (3 6 2 7 1 4 8 5) (3 6 2 7 5 1 8 4) (3 6 4 1 8 5 7 2) (3 6 4 2 8 5 7 1) (3 6 8 1 4 7 5 2) (3 6 8 1 5 7 2 4) (3 6 8 2 4 1 7 5) (3 7 2 8 5 1 4 6) (3 7 2 8 6 4 1 5) (3 8 4 7 1 6 2 5) (4 1 5 8 2 7 3 6) (4 1 5 8 6 3 7 2) (4 2 5 8 6 1 3 7) (4 2 7 3 6 8 1 5) (4 2 7 3 6 8 5 1) (4 2 7 5 1 8 6 3) (4 2 8 5 7 1 3 6) (4 2 8 6 1 3 5 7) (4 6 1 5 2 8 3 7) (4 6 8 2 7 1 3 5) (4 6 8 3 1 7 5 2) (4 7 1 8 5 2 6 3) (4 7 3 8 2 5 1 6) (4 7 5 2 6 1 3 8) (4 7 5 3 1 6 8 2) (4 8 1 3 6 2 7 5) (4 8 1 5 7 2 6 3) (4 8 5 3 1 7 2 6) (5 1 4 6 8 2 7 3) (5 1 8 4 2 7 3 6) (5 1 8 6 3 7 2 4) (5 2 4 6 8 3 1 7) (5 2 4 7 3 8 6 1) (5 2 6 1 7 4 8 3) (5 2 8 1 4 7 3 6) (5 3 1 6 8 2 4 7) (5 3 1 7 2 8 6 4) (5 3 8 4 7 1 6 2) (5 7 1 3 8 6 4 2) (5 7 1 4 2 8 6 3) (5 7 2 4 8 1 3 6) (5 7 2 6 3 1 4 8) (5 7 2 6 3 1 8 4) (5 7 4 1 3 8 6 2) (5 8 4 1 3 6 2 7) (5 8 4 1 7 2 6 3) (6 1 5 2 8 3 7 4) (6 2 7 1 3 5 8 4) (6 2 7 1 4 8 5 3) (6 3 1 7 5 8 2 4) (6 3 1 8 4 2 7 5) (6 3 1 8 5 2 4 7) (6 3 5 7 1 4 2 8) (6 3 5 8 1 4 2 7) (6 3 7 2 4 8 1 5) (6 3 7 2 8 5 1 4) (6 3 7 4 1 8 2 5) (6 4 1 5 8 2 7 3) (6 4 2 8 5 7 1 3) (6 4 7 1 3 5 2 8) (6 4 7 1 8 2 5 3) (6 8 2 4 1 7 5 3) (7 1 3 8 6 4 2 5) (7 2 4 1 8 5 3 6) (7 2 6 3 1 4 8 5) (7 3 1 6 8 5 2 4) (7 3 8 2 5 1 6 4) (7 4 2 5 8 1 3 6) (7 4 2 8 6 1 3 5) (7 5 3 1 6 8 2 4) (8 2 4 1 7 5 3 6) (8 2 5 3 1 7 4 6) (8 3 1 6 2 5 7 4) (8 4 1 3 6 2 7 5))












	      

