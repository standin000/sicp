Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

;Value: t

;Because Louis's method does "(queen-cols (- k 1))" n - 1 times
;more than it needed when it caulate (queen-cols k).
;assume the time (queen-cols k) consumes in old method is (T k)
;the time (queen-cols k) cnsumes in Louis's method is (L k)
(define (T n)
  (if (= n 1)
      C1
      (+ (T (- n 1))
	  C2)
      )
  )
;Value: "t --> #[compound-procedure 5 t]"

(define (L n)
  (if (= n 1)
      C1
      (+ (* 8 (L (- n 1)))
	 C2)
      )
  )
;Value: "l --> #[compound-procedure 7 l]"
;=> (/ (L n) (T n)) ~= n^(- n 1)

(define C1 1)
;Value: "c1 --> 1"

;C2 is the time adjoin-position consumes, assume it is 0
(define C2 0)
;Value: "c2 --> 0"

(/ (L 8) (T 8))
;Value: 2097152








