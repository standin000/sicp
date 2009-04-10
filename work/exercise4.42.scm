(driver-loop)


;;; Amb-Eval input:
; a or procedure for I do not want to add or as a special form into evaluator, so it is and.
; they are not perfect but enough for me.
(define (or a b)
  (if a
      true
      (if b
	  true
	  false
	  )
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (and a b)
  (if a
      (if b
	  true
	  false
	  )
      false
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (Liars)
  (let ((Betty (amb 1 2 3 4 5))
	(Ethel (amb 1 2 3 4 5))
	(Joan (amb 1 2 3 4 5))
	(Kitty (amb 1 2 3 4 5))
	(Mary (amb 1 2 3 4 5)))
    (require (distinct? (list Betty Ethel Joan Kitty Mary)))
    (require (justonetrue (= 2 Kitty) (= 3 Betty)))
    (require (justonetrue (= 1 Ethel) (= 2 Joan)))
    (require (justonetrue (= 3 Joan) (= 5 Ethel)))
    (require (justonetrue (= 2 Kitty) (= 4 Mary)))
    (require (justonetrue (= 4 Mary) (= 1 Betty)))
    (list (list 'Betty Betty)
	  (list 'Ethel Ethel)
	  (list 'Joan Joan)
	  (list 'Kitty Kitty)
	  (list 'Mary Mary))
    )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (justonetrue a b)
  (or (and a (not b)) (and (not a) b))
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (distinct? items)
  (cond ((null? items) true)
	((null? (cdr items)) true)
	((member (car items) (cdr items)) false)
	(else (distinct? (cdr items)))))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(Liars)

;;; Starting a new problem 
;;; Amb-Eval value:
((betty 3) (ethel 5) (joan 2) (kitty 1) (mary 4))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(liars)

;;; Amb-Eval input:
;Quit!





