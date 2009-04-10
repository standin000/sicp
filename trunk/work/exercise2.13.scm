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

;assume two interval are 
;(make-center-percent c1 p1)
;(make-center-percent c2 p2)
;the product of two interval is 
;(make-interval
; (* (+ c1 (* c1 p1)) (+ c2 (* c2 p2)))
; (* (- c1 (* c1 p1)) (- c2 (* c2 p2))))
;the percent of the product is
;(/ 
;   (- (* (- c1 (* c1 p1)) (- c2 (* c2 p2)))
;      (* (- c1 (* c1 p1)) (- c2 (* c2 p2))))
;   (+ (* (- c1 (* c1 p1)) (- c2 (* c2 p2)))
;      (* (- c1 (* c1 p1)) (- c2 (* c2 p2)))))
;=> (/ (+ p2 p1) (+ 1 (* p1 p2)))
;=> for (* p1 p2)~0 so it is (+ p2 p1) 
