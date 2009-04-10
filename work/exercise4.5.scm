(define (cond-addition-clause? clause)
  (eq? (car (cond-actions clause)) '=>)
  )

(define (expand-clauses clauses)
  (if (null? clauses)
      'false ; no else clause
      (let ((first (car clauses))
	    (rest (cdr clauses)))
	(if (cond-else-clause? first)
	    (if (null? rest)
		(sequence->exp (cond-actions first))
		(error "ELSE clause isn't last -- COND->IF"
		       clauses))
	    (if (cond-addition-clause? first)
		(let ((test (car first)))
		  (make-if test (list (caddr first) test)
			   (expand-clauses rest))
		  )
		(make-if (cond-predicate first)
			 (sequence->exp (cond-actions first))
			 (expand-clauses rest)))))))

(eval ' (cond ((assoc 'b '((a 1) (b 2))) => cadr)
	      (else false))
	the-global-environment)
;Value: 2

(eval ' (cond ((assoc 'c '((a 1) (b 2))) => cadr)
	      ((> 2 1) 0)
	      (else false))
	the-global-environment)
;Value: 0



