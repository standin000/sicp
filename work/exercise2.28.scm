Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (fringe tree)
  (if (pair? tree)
      (if (null? (cdr tree))
	    (fringe (car tree))
	    (append (fringe (car tree)) (fringe (cdr tree)))
	    )
	(cons tree nil)
	)
  )
;Value: "fringe --> #[compound-procedure 15 fringe]"

(define x (list (list 1 2) (list 3 4)))
;Value: "x --> ((1 2) (3 4))"

(fringe x)
;Value: (1 2 3 4)

(fringe (list x x))
;Value: (1 2 3 4 1 2 3 4)





