(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
;(factorial 6), n = 6.
;(factorial 6), n = 6, (factorial 5), n = 5.
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), n = 4.
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), (n = 3, factorial 3), n = 3;
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), (n = 3, factorial 3), n = 3
;(factorial 2), n = 2.
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), (n = 3, factorial 3), n = 3
;(factorial 2), n = 2, (factorial 1), n = 1.
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), (n = 3, factorial 3), n = 3
;(factorial 2), n = 2. result = 1
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), (n = 3, factorial 3), n = 3
;result = 2;
;(factorial 6), n = 6, (factorial 5), n = 5, (factorial 4), n = 4, result = 6;
;(factorial 6), n = 6, (factorial 5), n = 5, result = 24;
;(factorial 6), n = 6, result = 120;
;result = 720

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
		 (+ counter 1)
		 max-count)))
;(factorial 6)
;(fact-iter 1 1 6),product = 1, counter = 1  max-count = 6;
;(fact-iter 1 2 6),product = 1, counter = 2  max-count = 6;
;(fact-iter 2 3 6),product = 2, counter = 3  max-count = 6;
;(fact-iter 6 4 6),product = 6, counter = 4  max-count = 6;
;(fact-iter 24 5 6),product = 24, counter = 5  max-count = 6;
;(fact-iter 120 6 6),product = 120, counter = 6  max-count = 6;
;(fact-iter 720 7 6),product = 720, counter = 7  max-count = 6;
;result = 720