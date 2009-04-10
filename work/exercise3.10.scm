;http://groups.google.com/group/comp.lang.scheme/browse_frm/thread/a232962c3696b46e/bfadf8c6444abc48?lnk=gst&q=exercise+3.10&rnum=1&hl=en#bfadf8c6444abc48

(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))))

;global env: make-withdraw<|
;                  |       |
;                  |       |
;                  |>@@--->E1:balance = initial-amount
;                  |
;                  |>parameter:intial-amount
;                    body:...

(define (make-withdraw initial-amount)
  ((lambda (balance)
    (lambda (amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds")))
   initial-amount)
  )

;global env: make-withdraw<|
;                  |       |
;                  |       |
;                  |>@@----
;                  |
;                  |>parameter:intial-amount
;                   body:...

(define W1 (make-withdraw 100))
(W1 50)
(define W2 (make-draw 100))

;use let version
;global env: W1<|
;            |  |
;            |  |>E1: balance = initial-amount
;            |  |>E2: initial-amount = 100<|
;            |>@@                          |>E3 amount = 50  
;              |>parmaters: amount   (if (>= balance amount)
;              |>body: ...             (begin (set! balance (- balance amount))
;                                             balance)
;                                      "Insufficient funds")))

;global env: W2<|
;            |  |
;            |  |>E1: balance = initial-amount
;            |  |>E4: initial-amount = 100
;            |>@@                        
;              |>parmaters: amount
;              |>body: ...        
;                            
