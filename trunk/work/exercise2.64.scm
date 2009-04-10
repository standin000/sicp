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

(list->tree '(1 3 5 7 9 11))
;;; Evaluating in current module (guile-user)
; => (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;                5
;               / \
;              1   9
;               \ / \
;               3 7 11

;left-result = ((1 () (3 () ())) 5 7 9 11)
;left-tree = (1 () (3 () ()))
;non-left-elts = (5 7 9 11)
;this-entry = 5
;right-result = ((9 (7 () ()) (11 () ())))
;right-tree = (9 (7 () ()) (11 () ()))
;remaining-elts = '()
;the result is (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;the step of (partial-tree elts n) = (partial-tree elts left-size)
;                                  + (partial-tree (cdr non-left-elts)
;					      right-size)))
;so it is proportion to n.