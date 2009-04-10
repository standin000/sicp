Scheme saved on Saturday January 29, 2000 at 8:21:45 PM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Win32 1.5
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-rat n d)
  (cond ((> (/ n d) 0)
	 (cons (abs n) (abs d)))
	((< (/ n d) 0)
	 (cons (* -1 (abs n)) (abs d)))
	(else
	 (diplay error))
	)
  )
;Value: "make-rat --> #[compound-procedure 3 make-rat]"

(define (numer x) (car x))
;Value: "numer --> #[compound-procedure 6 numer]"

(define (denom x) (cdr x))
;Value: "denom --> #[compound-procedure 5 denom]"

(numer (make-rat 3 4))
;Value: 3

(denom (make-rat 3 4))
;Value: 4

(denom (make-rat -3 4))
;Value: 4

(numer (make-rat -3 4))
;Value: -3

(numer (make-rat 3 -4))
;Value: -3

(denom (make-rat 3 -4))
;Value: 4

(denom (make-rat -3 -4))
;Value: 4

(numer (make-rat -3 -4))
;Value: 3

