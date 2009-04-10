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

(define (make-segment x y)
  (cons x y))
;Value: "make-segment --> #[compound-procedure 2 make-segment]"

(define (start-segment z)
  (car z))
;Value: "start-segment --> #[compound-procedure 3 start-segment]"

(define (end-segment z)
  (cdr z))
;Value: "end-segment --> #[compound-procedure 4 end-segment]"

(define (make-point x y)
  (cons x y))
;Value: "make-point --> #[compound-procedure 5 make-point]"

(define (x-point z)
  (car z))
;Value: "x-point --> #[compound-procedure 6 x-point]"

(define (y-point z)
  (cdr z))
;Value: "y-point --> #[compound-procedure 7 y-point]"

(define (length-segment z)
  (sqrt
   (+ 
    (square
     (- (x-point (start-segment z)) (x-point (end-segment z)))
     )
    (square
     (- (y-point (start-segment z)) (y-point (end-segment z)))
     )
    )
   )
  )
;Value: "length-segment --> #[compound-procedure 16 length-segment]"

;x: a segment of rectangle's; y:another segment's length of rectangle
(define (rectangle x y)
  (cons x y))
;Value: "rectangle --> #[compound-procedure 9 rectangle]"

(define (rectangle-x-length z)
  (length-segment (car z)))
;Value: "rectangle-x-length --> #[compound-procedure 17 rectangle-x-length]"

(define (rectangle-y-length z)
  (cdr z))
;Value: "rectangle-y-length --> #[compound-procedure 18 rectangle-y-length]"

(define (perimeter z)
  (* 2 (+ (rectangle-x-length z) (rectangle-y-length z))))
;Value: "perimeter --> #[compound-procedure 19 perimeter]"

(define (area z)
  (* (rectangle-x-length z) (rectangle-y-length z)))
;Value: "area --> #[compound-procedure 20 area]"

(perimeter (rectangle (make-segment (make-point 0 0) (make-point  3 4)) 4))
;Value: 18

(area (rectangle (make-segment (make-point 0 0) (make-point  3 4)) 4))
;Value: 20

;x: a segment; y:the ratio between rectangle and square based on the segment
(define (rectangle x y)
  (cons x y))
;Value: "rectangle --> #[compound-procedure 9 rectangle]"

(define (rectangle-x-length z)
  (length-segment (car z)))
;Value: "rectangle-x-length --> #[compound-procedure 23 rectangle-x-length]"

(define (rectangle-y-length z)
  (* (rectangle-x-length z) (cdr z)))
;Value: "rectangle-y-length --> #[compound-procedure 24 rectangle-y-length]"

(area (rectangle (make-segment (make-point 0 0) (make-point  3 4)) 2))
;Value: 50

(perimeter (rectangle (make-segment (make-point 0 0) (make-point  3 4)) 2))
;Value: 30




