; definitions are interpreted sequentially
; There is only a frame.
; E1:u:e1, v:e2

; definitions are scanned out as described.
; E1: <vars>
; E2: u:*unassigned*, v:*unassigned*
;             |->(set! u <e1>) (set! v <e2>) <e3>
; E1: <vars>
; E2:u:e1, v:e2
;             |-><e3>

; The extra frame is used for defining variables with a special symbol
; and with it the subsquent expressions can regards them be defined 
; simultaneous.

; It is because the evaluation of the value expressions for the defined 
; variables doesn't actually use any of the defined variables, so it is
; naturally converted.

; It could be transformed into this form.
; (lambda <vars>
;   (define u '*unassigned*)
;   (define v '*unassigned*)
;   (set! u <e1>)
;   (set! v <e2>)
;   <e3>)