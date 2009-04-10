Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(list 1 (list 2 (list 3 4)))
;Value: (1 (2 (3 4)))

;[]->[]->[]->[nil]
;|   |   |   |
;1   2   3   4
;
;     (1 (2 (3 4)))
;      /       \
;   1       (2 (3 4))   
;              /    \
;            2     (3 4)
;                  /   \
;                 3     4