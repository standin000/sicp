(driver-loop)


;;; Amb-Eval input:
(define (or a b)
  (if a
      true
      (if b
	  true
	  false
	  )
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (and a b)
  (if a
      (if b
	  true
	  false
	  )
      false
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
;;; Amb-Eval input:
;; if I do not the efficient version, the time it need is fay beyond I think

(define (eight-queens)
  (let ((col1 (amb 1 2 3 4 5 6 7 8))
	(col2 (amb 1 2 3 4 5 6 7 8)))
	(require (safe? 2 (list col1 col2)))
	(let ((col3 (amb 1 2 3 4 5 6 7 8)))
	  (require (safe? 3 (list col1 col2 col3)))
	  (let ((col4 (amb 1 2 3 4 5 6 7 8)))
	    (require (safe? 4 (list col1 col2 col3 col4)))
	    (let ((col5 (amb 1 2 3 4 5 6 7 8)))
	      (require (safe? 5 (list col1 col2 col3 col4 col5)))
	      (let ((col6 (amb 1 2 3 4 5 6 7 8)))
		(require (safe? 6 (list col1 col2 col3 col4 col5 col6)))
		(let ((col7 (amb 1 2 3 4 5 6 7 8)))
		  (require (safe? 7 (list col1 col2 col3 col4 col5 col6 col7))) 
		  (let ((col8 (amb 1 2 3 4 5 6 7 8)))
		    (require (safe? 8 (list col1 col2 col3 col4 col5 col6 col7 col8)))
		    (list col1 col2 col3 col4 col5 col6 col7 col8)
		    )
		  )
		)
	      )
	    )
	  )
	)
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (safe? k positions)
  (define (safe-two-position r1 c1 r2 c2)
    (not
     (or
      (= c1 c2)
      (= (- r1 r2) (abs (- c1 c2)))
      )
     )
    )
  (define (safe-n? n)
; my or procedure can not work here.
    (if (= n 0)
	true
	(and
	 (safe-two-position (- k 1) (list-ref positions (- k 1))
			    (- n 1) (list-ref positions (- n 1)))
	 (safe-n? (- n 1))
	 )
     )
    )
  (safe-n? (- k 1))
 )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(eight-queens)

;;; Starting a new problem 
;;; Amb-Eval value:
(1 5 8 6 3 7 2 4)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(1 6 8 3 7 4 2 5)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(1 7 4 6 8 2 5 3)

;;; Amb-Eval input:
;Quit!

