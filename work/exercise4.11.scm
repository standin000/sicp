(define (make-frame variables values)
  (list (map cons variables values)))

(define (frame-variables frame)
  (map car (car frame)))
(define (frame-values frame) 
  (map cdr (car frame)))
(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons (cons var val) (car frame)))
  )

(define the-global-environment (setup-environment))
;Value: the-global-environment

(eval '(+ 1 2) the-global-environment)
;Value: 3

(eval '(define a 4) the-global-environment)
;Value: ok

(eval '(define add (lambda (a b) (+ a b))) the-global-environment)
;Value: ok

(eval '(add a 4) the-global-environment)
;Value: 8