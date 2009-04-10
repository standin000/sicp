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
;handle sigle key situation.
	((not (pair? keylist))
	 (let ((record (tree-lookup  keylist (cdr table))))
	       (if record
		   (begin (display "Get it") (cdr record))
		   #f)
	       )
	 )
	((null? (cdr keylist))
	 (let ((record (tree-lookup (car keylist) (cdr table))))
	       (if record
		   (begin (display "Get it") (cdr record))
		   #f)
	       )
	 )
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
;handle sigle key situation.
   ((not (pair? keylist))
    (let ((record (tree-lookup  keylist (cdr table))))
      (if record
	  (set-cdr! record value)
	  (set-cdr! table
		    (insert-table (cons keylist value) (cdr table)))
	  )
      )
    )
   ((null? (cdr keylist))
    (let ((record (tree-lookup (car keylist) (cdr table))))
      (if record
	  (set-cdr! record value)
	  (set-cdr! table
		    (insert-table (cons (car keylist) value) (cdr table)))
	  )
      )
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

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define memo-fib
  (memoize (lambda (n)
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
	(or previously-computed-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))

(memo-fib 3)
; 2

;=>(lookup 3 table)
;=>#f
;=>lambda function in memo-fib
;=>(+ (memo-fib 2) (memo-fib 1))
;=>(lookup 2 table)
;=>#f
;=>lambda function in memo-fib 2
;=>(+ (memo-fib 1) (memo-fib 0))
;=>(lookup 1 table)
;=>#f
;=>lambda function in memo-fib 1
;=>1
;insert (1 0) into table
;;=>(lookup 0 table)
;=>#f
;=>lambda function in memo-fib 0
;=>0
;=>insert (0 0) into table
;=>(lookup 1 table)
;=>#t
;=>1
;=>(+ 1 1)
;=>2

;(step (memo-fib 0)) = 1
;(step (memo-fib 1)) = 1
;assume
;(step (memo-fib n)) = n
;(step (memo-fib (+ n 1)))
;= (step (mem-fib n)) + (step (mem-fib (- n 1)))
;= n + (step (mem-fib (- n 1)))
;if we know (mem-fib n), we must know (mem-fib (- n 1)), so
;= n + 1;

;if we simply defined memo-fib to be (memoize fib), when we evaluate (memo-fib n),
;if n is not in table, it is directly into fib function, so it can not take
;advantage of information in table.

(memo-fib 3)
;Get it
; => 2

(define simple-memo-fib (memoize fib))

(simple-memo-fib 3)
;2

(memo-fib 4)
; Get itGet it\
;  => 3

(simple-memo-fib 3)
; Get it\
;  => 2





