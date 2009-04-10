; (define (set-to-wow! x)
; (set-car! (car x) 'wow)
; x)
; z1
; ((a b) a b)
; |  |
; a->b
;
; (set-to-wow! z1)
; |  |
;wow b
; ((wow b) wow b)

; z2
;  |     | 
;  a->b a->b
; ((a b) a b)
; (set-to-wow! z2)
;  |     | 
; wow->b a->b

; ((wow b) a b)