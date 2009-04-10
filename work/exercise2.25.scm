Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))
;Value: 7

(car (car '((7))))
;Value: 7

(car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))
;Value: (4 (5 (6 7)))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))
;Value: 7





