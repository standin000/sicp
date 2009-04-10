Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (unique-pairs n)
  (accumulate append
	      nil
	      (map (lambda (i)
		     (map (lambda (j) (list i j))
			  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))
  )
;Value: "unique-pairs --> #[compound-procedure 6 unique-pairs]"

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;Value: "enumerate-interval --> #[compound-procedure 4 enumerate-interval]"

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 5 accumulate]"

(unique-pairs 5)
;Value: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))


(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;Value: "prime-sum? --> #[compound-procedure 7 prime-sum?]"

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;Value: "make-pair-sum --> #[compound-procedure 8 make-pair-sum]"

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))
       )
  )
;Value: "prime-sum-pairs --> #[compound-procedure 9 prime-sum-pairs]"

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: "filter --> #[compound-procedure 10 filter]"

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: "smallest-divisor --> #[compound-procedure 14 smallest-divisor]"

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
;Value: "find-divisor --> #[compound-procedure 13 find-divisor]"

(define (divides? a b)
  (= (remainder b a) 0))
;Value: "divides? --> #[compound-procedure 11 divides?]"

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: "prime? --> #[compound-procedure 12 prime?]"

(prime-sum-pairs 5)
;Value: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7))

