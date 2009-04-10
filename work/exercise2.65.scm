(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))

(define (union-set set1 set2)
  (list->tree
   (tree->list-1 (union-tree set1 set2))
   )
  )

(define (union-tree tree1 tree2)
  (cond ((null? tree2) tree1)
	((null? tree1) tree2)
	((> (entry tree1) (entry tree2))
	 (union-tree
 	  (make-tree (entry tree1) 
 		     (union-tree (left-branch tree1) 
 				 (make-tree (entry tree2) (left-branch tree2) '()))
 		     (right-branch tree1)
 		     )
	   (right-branch tree2)
	   )
	 )
	((< (entry tree1) (entry tree2))
	 (union-tree
 	  (make-tree (entry tree2) 
 		     (union-tree (left-branch tree2) 
 				 (make-tree (entry tree1) (left-branch tree1) '()))
 		     (right-branch tree2)
 		     )
	   (right-branch tree1)
	   )
	 )
	(else
	  (make-tree (entry tree2) 
		     (union-tree (left-branch tree2) (left-branch tree1))
		     (union-tree (right-branch tree2) (right-branch tree1))
		     )
	  )
	)
  )

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((> (entry set1) (entry set2))
	 (list->tree
	  (append
	   (tree->list-1
	    (intersection-set 
	     (left-branch set1)
	     (make-tree (entry set2) (left-branch set2) '())
	     )
	    )
	   (tree->list-1
	    (intersection-set 
	     (make-tree (entry set1) (left-branch set1) (right-branch set1))
	     (right-branch set2)
	     )
	    )
	   )
	  )
	 )
	((< (entry set1) (entry set2))
	 (list->tree
	  (append
	   (tree->list-1
	    (intersection-set 
	     (left-branch set2)
	     (make-tree (entry set1) (left-branch set1) '())
	     )
	    )
	   (tree->list-1
	    (intersection-set 
	     (make-tree (entry set2) (left-branch set2) (right-branch set2))
	     (right-branch set1)
	     )
	    )
	   )
	  )
	 )
	(else
	 (make-tree (entry set2) 
		    (intersection-set (left-branch set2) (left-branch set1))
		    (intersection-set (right-branch set2) (right-branch set1))
		    )
	 )
	)
  )

(define tree1 (list->tree '(1 3 5 7 9)))
(define tree2 (list->tree '(2 4 6 8 10)))
(define tree3 (list->tree '(1 2 3 4 5 6 7 8 9 10)))
(define tree4 (list->tree '(1 2 3 4)))

(intersection-set tree2 tree3)
(intersection-set tree1 tree3)
(intersection-set tree1 tree2)
(intersection-set tree1 tree4)

(union-set tree1 tree3)
(union-set tree2 tree3)
(union-set tree1 tree2)
(union-set tree1 tree4)

; ;;; Evaluating expression 1 in current module (guile-user)
;  => (6 (2 () (4 () ())) (8 () (10 () ())))

; ;;; Evaluating expression 2 in current module (guile-user)
;  => (5 (1 () (3 () ())) (7 () (9 () ())))

; ;;; Evaluating expression 3 in current module (guile-user)
;  => ()

; ;;; Evaluating expression 4 in current module (guile-user)
;  => (1 () (3 () ()))

; ;;; Evaluating expression 5 in current module (guile-user)
;  => (5 (2 (1 () ()) (3 () (4 () ()))) (8 (6 () (7 () ())) (9 () (10 () ()))))

; ;;; Evaluating expression 6 in current module (guile-user)
;  => (5 (2 (1 () ()) (3 () (4 () ()))) (8 (6 () (7 () ())) (9 () (10 () ()))))

; ;;; Evaluating expression 7 in current module (guile-user)
;  => (5 (2 (1 () ()) (3 () (4 () ()))) (8 (6 () (7 () ())) (9 () (10 () ()))))

; ;;; Evaluating expression 8 in current module (guile-user)
;  => (4 (2 (1 () ()) (3 () ())) (7 (5 () ()) (9 () ())))

;First, I think I can convert tree to list first and use methods for list
;to implement these function, however I do not prefer it.
;Maybe there is a better implement, although I spend much time in it.
