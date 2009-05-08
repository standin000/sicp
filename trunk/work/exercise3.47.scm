;a
(define (make-semaphore)
  (let ((n 0) (mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (> n 0)
		 (begin
		   (mutex 'require)
		   (set! n (+ n 1))
		   (mutex 'release)
		   (the-semaphore 'wait)))) ; retry
	    ((eq? m 'wait)
	     (if (> n 0)
		 (the-semaphore 'wait)))
	    ((eq? m 'release)
	     (mutex 'require)
	     (set! n (- n 1))
	     (mutex 'release))))
    the-semaphore))

;b
(define (make-semaphore)
  (let ((n 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (test-and-set! n)
		 (the-semaphore 'acquire)))
	     ((eq? m 'release)
	      (clear! n))))))
(define (clear! n)
  (without-interrupts
   (lambda ()
     (set! n (- n 1))
     )
   )
  )

(define (test-and-set! n)
  (without-interrupts
   (lambda ()
     (if (> n 0)
	 true
	 (begin (set! n (+ n 1))
		false)))))

