; implement Louis Reasoner's application syntax.

(define (application? exp) 
  (tagged-list? exp 'call))

(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

(eval '(call + 1 2) the-global-environment)
;=>3

(eval '(call + (call - 2 1) (call + 3 1)) the-global-environment)
;=>5