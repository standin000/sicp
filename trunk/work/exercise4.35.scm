;; It must run ambevaluator.scm first and it need Edwin, GDS can
;; not do this job.

(driver-loop)


;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
	(require (= (+ (* i i) (* j j)) (* k k)))
	(list i j k)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (an-integer-between low high)
  (if (> high low)
      (amb low (an-integer-between (+ low 1) high))
      high
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(a-pythagorean-triple-between 1 10)

;;; Starting a new problem 
;;; Amb-Eval value:
(3 4 5)

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(6 8 10)

;;; Amb-Eval input:
try-again

;;; There are no more values of
(a-pythagorean-triple-between 1 10)

;;; Amb-Eval input:
;Quit!

