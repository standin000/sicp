Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
;Value: "make-frame --> #[compound-procedure 3 make-frame]"

(define (origin-frame f)
  (car f))
;Value: "origin-frame --> #[compound-procedure 4 origin-frame]"

(define (edge1-frame f)
  (cadr f))
;Value: "edge1-frame --> #[compound-procedure 5 edge1-frame]"

(define (edge2-frame f)
  (caddr f))
;Value: "edge2-frame --> #[compound-procedure 6 edge2-frame]"

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
;Value: "make-frame --> #[compound-procedure 7 make-frame]"

(define (origin-frame f)
  (car f))
;Value: "origin-frame --> #[compound-procedure 8 origin-frame]"

(define (edge1-frame f)
  (cadr f))
;Value: "edge1-frame --> #[compound-procedure 9 edge1-frame]"

(define (edge2-frame f)
  (cddr f))
;Value: "edge2-frame --> #[compound-procedure 11 edge2-frame]"
