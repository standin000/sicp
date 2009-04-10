; if use guile, it will cause stack flow: I'm very disappointed,
; I think the resource which my program need is not bigger, MIT scheme
; is good.

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(define (multiple-dwelling)
  (define (dwelling k)
    (if (= k 0)
	(list '())

	 (flatmap
	  (lambda (rest-of-dwelling)
	    (map (lambda (new-dwelling)
		   (adjoin-dwelling new-dwelling rest-of-dwelling))
		 (enumerate-interval 1 5)))
	  (dwelling (- k 1)))))
  (filter (lambda (dwellings) (OK? dwellings))  (dwelling 5))
  )

(define (adjoin-dwelling new-dwelling rest-of-dwelling)
  (append rest-of-dwelling (list new-dwelling))
  )

(define (distinct? items)
  (cond ((null? items) true)
	((null? (cdr items)) true)
	((member (car items) (cdr items)) false)
	(else (distinct? (cdr items)))))

(define (OK? dwellings)
  (let ((baker (list-ref dwellings 0))
	(cooper (list-ref dwellings 1))
	(fletcher (list-ref dwellings 2))
	(miller (list-ref dwellings 3))
	(smith (list-ref dwellings 4))) 
    (and 
     (distinct? dwellings)
     (not (= baker 5))
     (not (= cooper 1))  
     (not (= fletcher 5))
     (not (= fletcher 1))  
     (> miller cooper)  
     (not (= (abs (- smith fletcher)) 1))
     (not (= (abs (- fletcher cooper)) 1))
     )
    )
  )

(multiple-dwelling)
;Value: ((3 2 4 5 1))

