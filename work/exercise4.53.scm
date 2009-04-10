; it must follow by exercise4.52.scm exercise4.53.scm

(driver-loop)

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (smallest-divisor n)
  (find-divisor n 2))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (divides? a b)
  (= (remainder b a) 0))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (prime? n)
  (= n (smallest-divisor n)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (prime-sum-pair list1 list2)
  (let ((a (an-element-of list1))
	(b (an-element-of list2)))
    (require (prime? (+ a b)))
    (list a b)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(let ((pairs '()))
  (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
	     (permanent-set! pairs (cons p pairs))
	     (amb))
	   pairs))

;;; Starting a new problem 
;;; Amb-Eval value:
((8 35) (3 110) (3 20))

;;; Amb-Eval input:
;Quit!

