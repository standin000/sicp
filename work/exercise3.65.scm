(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (ln2-summands (+ n 1)))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (partial-sums s)
  (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sums s)))
  )

(define ln2 (partial-sums (ln2-summands 1)))

(define (test s n)
  (define (inner-test k)
    (if (< k n)
	(begin
	  (display (stream-ref s k))
	  (display ",")
	  (inner-test (+ k 1))
	  )
	'done
	)
    )
  (inner-test 0)
  )

;ln2 = 0.69314718055994530941723212145818

(test ln2 10)
;1.,.5,.8333333333333333,.5833333333333333,.7833333333333332,.6166666666666666,.7595238095238095,.6345238095238095,.7456349206349207,.6456349206349207,
;;Value: done

(define (euler-transform s)
  (let ((s0 (stream-ref s 0)) ; Sn-1
	(s1 (stream-ref s 1)) ; Sn
	(s2 (stream-ref s 2))) ; Sn+1
    (cons-stream (- s2 (/ (square (- s2 s1))
			  (+ s0 (* -2 s1) s2)))
		 (euler-transform (stream-cdr s)))))

(define (make-tableau transform s)
  (cons-stream s
	       (make-tableau transform
			     (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
	      (make-tableau transform s)))

(test (accelerated-sequence euler-transform
			    ln2) 10)
;1.,.7,.6932773109243697,.6931488693329254,.6931471960735491,.6931471806635636,.6931471805604039,.6931471805599445,.6931471805599427,.6931471805599454,
;Value: done
;Taking eight terms of the sequence yields the correct value of ln2 to 14 decimal places





