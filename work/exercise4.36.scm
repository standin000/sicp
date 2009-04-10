; Because our ambevaluator use depth-search strategy, so it will cause a meanless search, for
; example if we search from 1, the endless sequence produced by our program should be (1, 1, 1)
; (1, 1, 2), (1, 1, 3), (1 ,1, 4), ..., It can not produce sense results.

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
;Quit!

(define (all-pythagorean-triples)
  (define (internal-loop try-again input n)
      (if (eq? input 'try-again)
	  (try-again)
	  (begin
	    (newline)
	    (ambeval input
		     the-global-environment
		     ;; ambeval success
		     (lambda (val next-alternative)
		       (user-print val)
		       (internal-loop next-alternative 'try-again n))
		     ;; ambeval failure
		     (lambda ()
		       (internal-loop
			(lambda () 'not-reach)
			(list 'a-pythagorean-triple-between 1 (* 10 n))
			(+ n 1)
			))))))
  (internal-loop
   (lambda ()
     (newline)
     (display ";;; There is no current problem")
     (driver-loop))
   '(a-pythagorean-triple-between 1 10)
   1
   )
  )
;Value: "all-pythagorean-triples --> #[compound-procedure 14 all-pythagorean-triples]"

(all-pythagorean-triples)

(3 4 5)(6 8 10)
(3 4 5)(6 8 10)
(3 4 5)(5 12 13)(6 8 10)(8 15 17)(9 12 15)(12 16 20)
(3 4 5)(5 12 13)(6 8 10)(7 24 25)(8 15 17)(9 12 15)(10 24 26)(12 16 20)(15 20 25)(18 24 30)(20 21 29)
(3 4 5)(5 12 13)(6 8 10)(7 24 25)(8 15 17)(9 12 15)(10 24 26)(12 16 20)(12 35 37)(15 20 25)(15 36 39)(16 30 34)(18 24 30)(20 21 29)(21 28 35)(24 32 40)
;Quit!
;;maybe I can remove duplicate results.