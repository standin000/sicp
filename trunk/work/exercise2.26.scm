Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define x (list 1 2 3))
;Value: "x --> (1 2 3)"

(define y (list 4 5 6))
;Value: "y --> (4 5 6)"

; (1 2 3 4 5 6)
(append x y)
;Value: (1 2 3 4 5 6)

;((1 2 3) 4 5 6)
(cons x y)
;Value: ((1 2 3) 4 5 6)

;((1 2 3) (4 5 6))
(list x y)
;Value: ((1 2 3) (4 5 6))

