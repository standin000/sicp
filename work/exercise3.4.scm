(define (make-account balance password)
  (let ((counter 1))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  (error "Insufficient funds")))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch p m)
      (if (eq? p password)
; begin will return the last expression's value and I need return
; cond's value here
	  (begin
	    (set! counter 1)
	    (cond ((eq? m 'withdraw) withdraw)
		  ((eq? m 'deposit) deposit)
		  (else (error "Unknown request -- MAKE-ACCOUNT"
			       m)))
	    )
;when error is executed, program will be end and the remain instruction can
;not be executed.
	  (if (< counter 7)
	      (begin
		(set! counter (+ counter 1))
		(error "Incorrect password" p)
		)
	      (error "call-the-cops")
	      )
	  )
      )
    dispatch
    )
  )
  

(define acc (make-account 100 'secret-password))

((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: Incorrect password some-other-password
((acc 'some-other-password 'withdraw) 50)
;ERROR: call-the-cops




