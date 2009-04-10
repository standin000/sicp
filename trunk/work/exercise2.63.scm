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

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))

;(null? nil) in MIT scheme is true but in guile is false
;(null? '()) both is true.
(define tree1 (make-tree 7 
			(make-tree 3 
				   (make-tree 1 '() '())
				   (make-tree 5 '() '()))
			(make-tree 9 '()
				   (make-tree 11 '() '())
				   )
			)
  )

(define tree2 (make-tree 3 
			(make-tree 1 '() '()) 
			(make-tree 7
				   (make-tree 5 '() '())
				   (make-tree 9 '()
					      (make-tree 11 '() '()))
				   )
			)
  )

(define tree3 (make-tree 5 
			(make-tree 3 
				   (make-tree 1 '() '())
				   '())
			(make-tree 9
				   (make-tree 7 '() '())
				   (make-tree 11 '() '())
				   )
			)
  )

(tree->list-1 tree1)

(tree->list-2 tree1)

(tree->list-1 tree2)

(tree->list-2 tree2)

(tree->list-1 tree3)

(tree->list-2 tree3)

; ;;; Evaluating expression 1 in current module (guile-user)
;  => (1 3 5 7 9 11)

; ;;; Evaluating expression 2 in current module (guile-user)
;  => (1 3 5 7 9 11)

; ;;; Evaluating expression 3 in current module (guile-user)
;  => (1 3 5 7 9 11)

; ;;; Evaluating expression 4 in current module (guile-user)
;  => (1 3 5 7 9 11)

; ;;; Evaluating expression 5 in current module (guile-user)
;  => (1 3 5 7 9 11)

; ;;; Evaluating expression 6 in current module (guile-user)
;  => (1 3 5 7 9 11)

;a: The result is identical
;b: procedure 1 grows more slowly. prcedure 2 is tail-recursive,
;it does not need shrink