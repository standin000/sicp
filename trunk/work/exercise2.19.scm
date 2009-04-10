Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define us-coins (list 50 25 10 5 1))
;Value: "us-coins --> (50 25 10 5 1)"

(define uk-coins (list 100 50 20 10 5 2 1 0.5))
;Value: "uk-coins --> (100 50 20 10 5 2 1 .5)"

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))
;Value: "cc --> #[compound-procedure 3 cc]"

(define (no-more? items)
  (null? items))
;Value: "no-more? --> #[compound-procedure 4 no-more?]"

(define (except-first-denomination items)
  (cdr items))
;Value: "except-first-denomination --> #[compound-procedure 5 except-first-denomination]"

(define (first-denomination items)
  (car items))
;Value: "first-denomination --> #[compound-procedure 6 first-denomination]"

(cc 100 us-coins)
;Value: 292

(cc 10 uk-coins)
;Value: 50

(define reverse-us-coins (list 1 5 10 25 50))
;Value: "reverse-us-coins --> (1 5 10 25 50)"

(cc 100 reverse-us-coins)
;Value: 292

;The order of the list coin-values does not affect the answer produced by cc,
;because first-denomination can be implemented by other methods.
