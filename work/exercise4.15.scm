; (define (run-forever) (run-forever))
; (define (try p)
;   (if (halts? p p)
;       (run-forever)
;       'halted))
; If (try try) halts, then (halts? p p) is true, it will run-forever;
; If (try try) does not halt, then (halts? p p) is false, it will halt.
; so halts can not exist!