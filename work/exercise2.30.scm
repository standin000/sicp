Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (square-tree tree)
  (cond ((pair? tree)
	(cons (square-tree (car tree))
	      (square-tree (cdr tree))))
	((null? tree) tree)
	(else (square tree))
	)
  )
;Value: "square-tree --> #[compound-procedure 28 square-tree]"

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value: (1 (4 (9 16) 25) (36 49))

(define (square-tree tree)
  (map (lambda (tree)
	 (if (pair? tree)
	     (square-tree tree)
	     (square tree))
	 )
       tree
       )
  )
;Value: square-tree

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value: (1 (4 (9 16) 25) (36 49))
