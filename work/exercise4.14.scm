(define the-global-environment (extend-environment (list 'map) (list (list 'primitive map)) the-global-environment))

(eval '(map cadr '((a b) (d e) (g h))) the-global-environment)
;;; Evaluating in current module (guile-user)
; ((primitive #<primitive-procedure cadr>) ((a b) (d e) (g h)))EXCEPTION: wrong-type-arg ("apply" "Wrong type argument in position ~A: ~S" (1 (primitive #<primitive-procedure cadr>)) #f)
;  => unhandled-exception-in-evaluation

; It is because primitive map will use orignal apply of scheme language not our
; apply function, so it can not recognize our primitive of evulator.







