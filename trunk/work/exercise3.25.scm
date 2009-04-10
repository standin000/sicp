(define (make-table)
  (list '*table*))

(define (assoc key records)
  (cond ((null? records) #f)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (lookup keylist table)
  (cond ((null? keylist) 
	 (error "Error Keylist")
	 )
	((null? (cdr keylist))
	 (let ((record (assoc (car keylist) (cdr table))))
	       (if record
		   (cdr record)
		   #f)
	       ))
	(else (let ((subtable (assoc (car keylist) (cdr table))))
		(if subtable
		    (lookup (cdr keylist) subtable)
		    #f)
		))
	)
  )
		
(define (insert! keylist value table)
  (define (insert-make-table keylist)
    (if (null? (cdr keylist))
	(cons (car keylist) value)
	(list (car keylist) (insert-make-table (cdr keylist)))
	)
    )
  (cond
   ((null? keylist) 
    (error "Error Keylist")
    )
   ((null? (cdr keylist))
    (let ((record (assoc (car keylist) (cdr table))))
      (if record
	  (set-cdr! record value)
	  (set-cdr! table
		    (cons (cons (car keylist) value)
			  (cdr table)))))
    )
   (else (let ((subtable (assoc (car keylist) (cdr table))))
	   (if subtable
	       (insert! (cdr keylist) value subtable)
	       (set-cdr! table
			 (cons (insert-make-table keylist)
			       (cdr table)))))
	 )
   )
  'ok)

(define 1-table (make-table))

(insert! '(1) 'a 1-table)
(lookup '(1) 1-table)
;a

(insert! '(1) 'b 1-table)
(lookup '(1) 1-table)
;b

(insert! '(2) 'c 1-table)
(lookup '(2) 1-table)
;c

(define 2-table (make-table))
(insert! '(1 2) 'a 2-table)
(lookup '(1 2) 2-table)
;a

(insert! '(1 2) 'b 2-table)
(lookup '(1 2) 2-table)
;b

(insert! '(3 4) 'c 2-table)
(lookup '(3 4) 2-table)
;c

(define 3-table (make-table))

(insert! '(1 2 3) 'a 3-table)
(lookup '(1 2 3) 3-table)
;a

(insert! '(1 2 3) 'b 3-table)
(lookup '(1 2 3) 3-table)
;b

(insert! '(4 5 6) 'c 3-table)
(lookup '(4 5 6) 3-table)
;c







