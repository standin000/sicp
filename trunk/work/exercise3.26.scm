(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (key entry)
  (car entry))

(define (tree-lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
	((= given-key (key (entry set-of-records)))
	 (car set-of-records))
	((< given-key (key (entry set-of-records)))
	 (tree-lookup given-key (left-branch set-of-records)))
	(else (tree-lookup given-key (right-branch set-of-records)))))

(define (insert-table x set)
  (cond ((null? set) (make-tree x '() '()))
	((= (key x) (key (entry set))) set)
	((< (key x) (key (entry set)))
	 (make-tree (entry set)
		    (insert-table x (left-branch set))
		    (right-branch set)))
	((> (key x) (key (entry set)))
	 (make-tree (entry set)
		    (left-branch set)
		    (insert-table x (right-branch set))))))


(define (make-table)
  (list '*table*))

(define (lookup keylist table)
  (cond ((null? keylist) 
	 (error "Error Keylist")
	 )
	((null? (cdr keylist))
	 (let ((record (tree-lookup (car keylist) (cdr table))))
	       (if record
		   (cdr record)
		   #f)
	       ))
	(else (let ((subtable (tree-lookup (car keylist) (cdr table))))
		(if subtable
		    (lookup (cdr keylist) subtable)
		    #f)
		))
	)
  )
		
(define (insert! keylist value table)
  (define (insert-make-table keylist)
    (if (null? (cdr keylist))
	(make-tree (cons (car keylist) value) '() '())
	(make-tree (cons (car keylist) (insert-make-table (cdr keylist)))
		   '() '())
	)
    )
  (cond
   ((null? keylist) 
    (error "Error Keylist")
    )
   ((null? (cdr keylist))
    (let ((record (tree-lookup (car keylist) (cdr table))))
      (if record
	  (set-cdr! record value)
	  (set-cdr! table
		    (insert-table (cons (car keylist) value) (cdr table)))
	  )
      )
; 	  (set-cdr! table
; 		    (cons (cons (car keylist) value)
; 			  (cdr table)))))
      )
   (else (let ((subtable (tree-lookup (car keylist) (cdr table))))
	   (if subtable
	       (insert! (cdr keylist) value subtable)
	       (set-cdr! table
			 (cons (insert-make-table keylist)
			       (cdr table)))))
	 )
   )
  'ok)

(define a (make-table))

(insert! '(1) '1 a)

(lookup '(1) a)
;1

(insert! '(2) '2 a)

(lookup '(2) a)
;2

(insert! '(0) '0 a)

(lookup '(0) a)
;0

(insert! '(3) '3 a)

(lookup '(3) a)
;3

(insert! '(2.5) '2.5 a)

(lookup '(2.5) a)
;2.5
