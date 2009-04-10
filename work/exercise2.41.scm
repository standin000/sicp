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
;Value: "accumulate --> #[compound-procedure 3 accumulate]"

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
;Value: "flatmap --> #[compound-procedure 4 flatmap]"

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))
		  )
	     )
	   (enumerate-interval 1 n)
	   )
  )
;Value: "unique-pairs --> #[compound-procedure 5 unique-pairs]"

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;Value: "enumerate-interval --> #[compound-procedure 6 enumerate-interval]"

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: "filter --> #[compound-procedure 11 filter]"

(define (unique-triple n)
  (flatmap (lambda (i)
	     (map (lambda (j) 
			(append j (list i))
		    )
		  (filter (lambda (k) (< i (cadr k)))
			    (unique-pairs n))
		  )
	     )
	   (enumerate-interval 1 n)
	   )
  )
;Value: "unique-triple --> #[compound-procedure 12 unique-triple]"

(unique-triple 5)
;Value: ((3 2 1) (4 2 1) (4 3 1) (5 2 1) (5 3 1) (5 4 1) (4 3 2) (5 3 2) (5 4 2) (5 4 3))

(define (sum-triple n s)
  (filter (lambda (triple)
	    (= (+ (car triple) (cadr triple) (caddr triple)) s)
	       )
       (unique-triple n)
       )
  )
;Value: "sum-triple --> #[compound-procedure 16 sum-triple]"

(sum-triple 5 8)
;Value: ((4 3 1) (5 2 1))

(sum-triple 5 10)
;Value: ((5 4 1) (5 3 2))

(sum-triple 5 11)
;Value: ((5 4 2))

;reference from code17 (define (sum-s? x s) (= (accumulate + 0 x) s)) is good.
;but my method for sum-triple is good for it can be expanded to n-set easily.



