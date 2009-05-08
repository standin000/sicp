; It need load ch5-regsim.scm, ch5-syntax.scm, ch5-eceval-support.scm,
; ch5-eceval.scm.
(define the-global-environment (setup-environment))
;Value: "the-global-environment --> ((... #f #t ... ... ... ... ... ... ... ...))"

(start eceval)


;;; EC-Eval input:
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
	product
	(iter (* counter product)
	      
	      (+ counter 1))))
  (iter 1 1))

(total-pushes = 3 maximum-depth = 3)
;;; EC-Eval value:
ok

;;; EC-Eval input:
(factorial 3)

(total-pushes = 134 maximum-depth = 10)
;;; EC-Eval value:
6

;;; EC-Eval input:
(factorial 5)

(total-pushes = 204 maximum-depth = 10)
;;; EC-Eval value:
120

;;; EC-Eval input:
(factorial 9)

(total-pushes = 344 maximum-depth = 10)
;;; EC-Eval value:
362880

;;; EC-Eval input:

;;a: The max depth is 10


;;; EC-Eval input:
(factorial 1)

(total-pushes = 64 maximum-depth = 10)
;;; EC-Eval value:
1

;;; EC-Eval input:
(factorial 2)

(total-pushes = 99 maximum-depth = 10)
;;; EC-Eval value:
2

;;; EC-Eval input:
(factorial 4)

(total-pushes = 169 maximum-depth = 10)
;;; EC-Eval value:
24

;;; EC-Eval input:
(factorial 6)

(total-pushes = 239 maximum-depth = 10)
;;; EC-Eval value:
720

;;; EC-Eval input:
(factorial 7)

(total-pushes = 274 maximum-depth = 10)
;;; EC-Eval value:
5040

;;; EC-Eval input:
(factorial 8)

(total-pushes = 309 maximum-depth = 10)
;;; EC-Eval value:
40320

;;; EC-Eval input:
;;b: it is 35n+64

