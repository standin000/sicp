(define (test-and-set! cell)
  (without-interrupts
   (lambda ()
     (if (car cell)
	 true
	 (begin (set-car! cell true)
		false)))))

(define (make-mutex)
  (let ((cell (list false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
	     (if (test-and-set! cell)
		 (the-mutex 'acquire))) ; retry
	    ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-car! cell false))

(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (p)
      (define (serialized-p . args)
	(mutex 'acquire)
	(let ((val (apply p args)))
	  (mutex 'release)
	  val))
      serialized-p)))


; if we use Ben's idea, I think we need support reentrant and thread-safe code
; for the serialized procedure will be paralleling executed in many threads.