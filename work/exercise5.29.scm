;; use non tail recursive version from exercise 5.28
;;; EC-Eval input:
(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(total-pushes = 3 maximum-depth = 3)
;;; EC-Eval value:
ok

;;; EC-Eval input:
(fib 2)

(total-pushes = 78 maximum-depth = 19)
;;; EC-Eval value:
1

;;; EC-Eval input:
(fib 3)

(total-pushes = 138 maximum-depth = 27)
;;; EC-Eval value:
2

;;; EC-Eval input:
(fib 4)

(total-pushes = 258 maximum-depth = 35)
;;; EC-Eval value:
3

;;; EC-Eval input:
(fib 5)

(total-pushes = 438 maximum-depth = 43)
;;; EC-Eval value:
5

;;; EC-Eval input:
(fib 6)

(total-pushes = 738 maximum-depth = 51)
;;; EC-Eval value:
8

;;; EC-Eval input:
; maximum depth is 8n+3
; S(n) = S(n - 1) + S(n - 2) + 42
; S(n) = 60 * Fib(n + 1) - 42 = 60 * O^n/(5^0.5) - 42 (O = (1 + 5^0.5) / 2)
