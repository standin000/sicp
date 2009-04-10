((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
	  1
	  (* k (ft ft (- k 1))))))) 5)
; => 120

((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
	  1
	  (* k (ft ft (- k 1))))))) 4)
; => 24

(define fib 
  (lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (if (= k 1)
	  1
	  (if (= k 0)
	      0
	      (+ (fb fb (- k 1)) (fb fb (- k 2)))))))))

(fib 0)
; => 0

(fib 1)
; => 1

(fib 3)
; => 2

(fib 6)
; => 8

(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) #t (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) #f (ev? ev? od? (- n 1))))))

(f 3)
; => #f

(f 8)
; => #t