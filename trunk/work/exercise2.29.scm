Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-mobile left right)
  (list left right))
;Value: "make-mobile --> #[compound-procedure 3 make-mobile]"

(define (make-branch length structure)
  (list length structure))
;Value: "make-branch --> #[compound-procedure 4 make-branch]"

(define (left-branch mobile)
  (car mobile))
;Value: "left-branch --> #[compound-procedure 5 left-branch]"

(define (right-branch mobile)
  (car (cdr mobile)))
;Value: "right-branch --> #[compound-procedure 11 right-branch]"

(define (branch-length branch)
  (car branch))
;Value: "branch-length --> #[compound-procedure 7 branch-length]"

(define (branch-structure branch)
  (car (cdr branch)))
;Value: "branch-structure --> #[compound-procedure 12 branch-structure]"

(define (total-weight-branch branch)
  (let ((m (branch-structure branch)))
    (if (pair? m)
	(total-weight-mobile m)
	m)
    )
  )
;Value: "total-weight-branch --> #[compound-procedure 14 total-weight-branch]"


(define (total-weight mobile)
  (+
   (total-weight-branch (left-branch mobile))
   (total-weight-branch (left-branch mobile))
   )
)
;Value: "total-weight --> #[compound-procedure 13 total-weight]"


(define (balanced? mobile)
  (let ((lb  (left-branch mobile))
	(rb  (right-branch mobile)))
    (and
     (= (* (branch-length lb) (total-weight-branch lb))
        (* (branch-length rb) (total-weight-branch rb))
	)
     (balanced? (branch-structure lb))
     (balanced? (branch-structure rb))
     )
    )
  )
;Value: "balanced? --> #[compound-procedure 16 balanced?]"

;Modify: (define (right-branch mobile) (cdr mobile))
;(define (branch-structure branch) (cdr branch))





