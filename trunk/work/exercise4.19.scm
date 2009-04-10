; use method of exercise 4.16.
(eval '(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10)) the-global-environment)
;ERROR: *unassigned*

; it seems difficult to implement a general, efficient mechanism 
; that does what Eva requires. I think there are two complex method:
; a. scan all definitions and sort them by depend relation: If
; one is depend on another one, it is put after another one.
; b. repeat evalute definitions until there is not visit *unassigned*
; exception, it meet and omit.
