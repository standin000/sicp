(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request -- MAKE-ACCOUNT"
		       m))))
  dispatch)

(define acc (make-account 50))
((acc 'deposit) 40)

;global env: make-account <-> code
;|>;E1: balance = 50, withdraw, deposit, dispatch
;                      |>code    |>code    |>code
;E2: m = 'deposit, call dispatch
;E3: amount = 40, call deposit

;; I think acc and acc2 shared make-account, dispatch procedure.