Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (same-parity i . items)
  (define (filter items)
    (cond ((null? items) nil)
	  ((and (odd? i) (odd? (car items)))
	   (cons (car items) (filter (cdr items))))
	  ((not (or (odd? i) (odd? (car items))))
	   (cons (car items) (filter (cdr items))))
	  (else (filter (cdr items)))
	  )
    )
  (cons i (filter items))
  )
;Value: "same-parity --> #[compound-procedure 15 same-parity]"

(same-parity 1 2 3 4 5 6 7)
;Value: (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;Value: (2 4 6)
















	       
      