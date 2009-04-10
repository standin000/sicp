; if it do not need distinct restriction, there are 5^5 = 3125
; assignments, or there are 5! = 120 assignments. 

(driver-loop)


;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (distinct? items)
  (cond ((null? items) true)
	((null? (cdr items)) true)
	((member (car items) (cdr items)) false)
	(else (distinct? (cdr items)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (let ((cooper (amb 1 2 3 4 5)))
      (require (not (= baker cooper)))
      (require (not (= cooper 1)))
      (let ((fletcher (amb 1 2 3 4 5)))
	(require (not (= fletcher 5)))
	(require (not (= fletcher 1)))
	(require (not (= (abs (- fletcher cooper)) 1)))
	(require (not (member fletcher (list baker cooper))))
	(let ((miller (amb 1 2 3 4 5)))
	  (require (> miller cooper))
	  (require (not (member miller (list baker cooper fletcher))))
	  (let ((smith (amb 1 2 3 4 5)))
	    (require (not (= (abs (- smith fletcher)) 1)))	    
	    (require
	     (not (member smith (list baker cooper fletcher miller))))
	    (list (list 'baker baker)
		  (list 'cooper cooper)
		  (list 'fletcher fletcher)
		  (list 'miller miller)
		  (list 'smith smith)))
	  )
	)
      )
    )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(multiple-dwelling)

;;; Starting a new problem 
;;; Amb-Eval value:
((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(multiple-dwelling)

;;; Amb-Eval input:
;Quit!