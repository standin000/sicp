(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (eq? p password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	(error "Incorrect password")
	)
    )
  dispatch
  )

(define (make-joint acc p1 p2)
  (define (dispatch p m)
    (if (eq? p p2)
	(cond ((eq? m 'withdraw) (acc p1 'withdraw))
	      ((eq? m 'deposit) (acc p1 'deposit))
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	(error "Incorrect password")
	)
    )
  dispatch
  )

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 50)
;150

((peter-acc 'open-sesame 'withdraw) 70)
;80

((paul-acc 'rosebud 'withdraw) 50)
;30

((peter-acc 'open-sesame 'deposit) 70)
;100

