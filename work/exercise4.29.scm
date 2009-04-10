;; (define (need-memoization n)
;;   (define (id x) (slow-operation) 10)
;;   (define x (id 10))
;;   (define (loop n)
;;     (if (= n 1) 1 (* x (loop (- n 1))))
;;     )
;;   (loop n)
;;   )
;; If we evaluate (need-memoization 10000) without memoization
;; the slow-operation need be exectued for 10000 times, but with
;; memoization, it need be exectued for one times.

;use memoization 
(eval '(define (square x) (* x x)) the-global-environment)

(eval '(define count 0) the-global-environment)

(eval '(define (id x) 
	 (set! count (+ count 1))
	 x)
      the-global-environment)

(eval '(square (id 10)) the-global-environment)
; => 100

(eval 'count the-global-environment)
; => 1
;use without memoization version
(define (force-it obj)
  (if (thunk? obj)
      (actual-value (thunk-exp obj) (thunk-env obj))
      obj))

(eval '(define (square x) (* x x)) the-global-environment)

(eval '(define count 0) the-global-environment)

(eval '(define (id x) 
	 (set! count (+ count 1))
	 x)
      the-global-environment)

(eval '(square (id 10)) the-global-environment)
; => 100

(eval 'count the-global-environment)
; => 2, it is because (* x x) in square will cause (id 10) being
; evaluated twice.


