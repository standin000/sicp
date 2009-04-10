(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (cdr record)
		  #f))
	    #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (set-cdr! record value)
		  (set-cdr! subtable
			    (cons (cons key-2 value)
				  (cdr subtable)))))
	    (set-cdr! local-table
		      (cons (list key-1
				  (cons key-2 value))
			    (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define a-table (make-table (lambda (x y) (< (abs (- x y)) 2))))

(list 'a (cons 'b 'c))

(define ddd '(a b))
(begin 
  (set-cdr! (last-pair ddd) 'c)
  ddd)


(define a-put (a-table 'insert-proc!))
(define a-get (a-table 'lookup-proc))

(a-put 4 5 'abc)

(a-get 3 4)
;abc

(a-get 4 5)
;abc

(a-put 3 4 'def)

(a-get 3 4)
;def

(a-get 4 5)
;def

(a-put 8 9 'ghi)

(a-get 9 10)
;ghi

(a-get 11 12)
;#f