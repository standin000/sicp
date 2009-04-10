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

(define (make-interval l h)
  (cons l h))
;Value: "make-interval --> #[compound-procedure 4 make-interval]"
(define (lower-bound i)
  (car i))
;Value: "lower-bound --> #[compound-procedure 5 lower-bound]"

(define (upper-bound i)
  (cdr i))
;Value: "upper-bound --> #[compound-procedure 6 upper-bound]"

(define (make-center-percent c p)
  (cons (- c (* c  p)) (+ c (* c  p))))
;Value: "make-center-percent --> #[compound-procedure 7 make-center-percent]"

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: "center --> #[compound-procedure 8 center]"

(define (percent i)
  (/ (- (upper-bound i) (lower-bound i))
     (+ (lower-bound i) (upper-bound i)))
  )
;Value: "percent --> #[compound-procedure 9 percent]"

(percent (make-center-percent 10 0.1))
;Value: .1

(center (make-center-percent 10 0.1))
;Value: 10.

(center (make-center-percent 7 0.3))
;Value: 7.

(percent (make-center-percent 7 0.3))
;Value: .29999999999999993

(- 9.1 4.9)
;Value: 4.199999999999999
