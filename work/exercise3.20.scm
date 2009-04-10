(define x (cons 1 2))
; | |
; 1 2

(define z (cons x x))
;  ||
; |  |
; 1  2

(set-car! (cdr z) 17)
;z:
;  ||
; |  |
;17  2
;x:
; | |
;17 2
(car x)
;17