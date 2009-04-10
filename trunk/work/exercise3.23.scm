(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-deque? queue) 
  (or (null? (front-ptr queue))
      (null? (rear-ptr queue))
      )
  )

(define (make-deque) (cons '() '()))

(define (front-deque queue)
  (if (empty-deque? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (rear-deque queue)
  (if (empty-deque? queue)
      (error "REAR called with an empty queue" queue)
      (car (rear-ptr queue))))

;in order to satisfy that all operations should be accomplished in O(1) steps,
;I use bidirectional queue
(define (front-insert-deque! queue item)
  (let ((new-pair (list item '())))
    (cond ((empty-deque? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	   (set-cdr! (cdr new-pair) (front-ptr queue))
	   (set-car! (cdr (front-ptr queue)) new-pair)
	   (set-front-ptr! queue new-pair)
	   queue))))

(define (front-delete-deque! queue)
  (cond ((empty-deque? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else
	 (set-front-ptr! queue (cddr (front-ptr queue)))
	 (if (pair? (front-ptr queue))
	     (set-car! (cdr (front-ptr queue)) '()))
	 queue)))

(define (rear-insert-deque! queue item)
  (let ((new-pair (list item '())))
    (cond ((empty-deque? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	   (set-car! (cdr new-pair) (rear-ptr queue))
	   (set-cdr! (cdr (rear-ptr queue)) new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue))))

(define (rear-delete-deque! queue)
  (cond ((empty-deque? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else
	 (set-rear-ptr! queue (cadr (rear-ptr queue)))
	 (if (pair? (rear-ptr queue))
	     (set-cdr! (cdr (rear-ptr queue)) '()))
	 queue)
	)
  )

(define (print-deque queue)
  (define (print-deque-helper list)
    (cond 
     ((null? list) (display ")"))
     ((eq? list (rear-ptr queue))
      (display (car list))
      (display ")")
      )
     (else
      (display (car list))
      (display " ")
      (print-deque-helper (cddr list)))
     )
    )
  (display "(")
  (if (empty-deque? queue)
      (display ")")
      (print-deque-helper (front-ptr queue))
      )
  )

(define q1 (make-deque))
(print-deque q1)
;()

(front-insert-deque! q1 'a)
(print-deque q1)
;(a)

(front-insert-deque! q1 'b)
(print-deque q1)
;(b a)

(front-delete-deque! q1)
(print-deque q1)
;(a)

(rear-insert-deque! q1 'c)
(print-deque q1)
;(a c)

(rear-insert-deque! q1 'd)
(print-deque q1)
;(a c d)

(rear-delete-deque! q1)
(print-deque q1)
;(a c)

(front-delete-deque! q1)
(print-deque q1)
;(c)

(rear-insert-deque! q1 'e)
(print-deque q1)
;(c e)

(rear-delete-deque! q1)
(print-deque q1)
;(c)

(front-delete-deque! q1)
(print-deque q1)
;()

(front-insert-deque! q1 'f)
(print-deque q1)
;(f)

(rear-delete-deque! q1)
(print-deque q1)
;()

(rear-insert-deque! q1 'g)
(print-deque q1)
;(g)