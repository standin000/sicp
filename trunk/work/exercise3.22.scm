(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr)
      )
    (define (front-queue)
      (if (empty-queue?)
	  (error "FRONT called with an empty queue")
	  (car front-ptr)
	  )
      )
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?)
	       (set! front-ptr new-pair)
	       (set! rear-ptr new-pair)
	       )
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set! rear-ptr new-pair)
	       )
	      )
	)
      )
     (define (delete-queue!)
       (cond
	((empty-queue?)
	 (error "DELETE! called with an empty queue"))
	(else
	 (set! front-ptr (cdr front-ptr)))
	)
       )
    (define (dispatch m)
      (cond ((equal? m "front-queue")  (front-queue))
	    ((equal? m "insert-queue!") insert-queue!)
	    ((equal? m "delete-queue!") (delete-queue!))
	    )
      )
    dispatch
    )
  )

(define (front-queue queue)
  (queue "front-queue")
  )

(define (insert-queue! queue item)
  ((queue "insert-queue!") item)
  )

(define (delete-queue! queue)
  (queue "delete-queue!")
  )

(define q1 (make-queue))

(insert-queue! q1 'a)

(front-queue q1)
;a

(insert-queue! q1 'b)

(front-queue q1)
;a

(delete-queue! q1)

(front-queue q1)
;b

(delete-queue! q1)

(front-queue q1)
;ERROR: FRONT called with an empty queue

(delete-queue! q1)
;ERROR: DELETE! called with an empty queue


