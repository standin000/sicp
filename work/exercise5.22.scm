;assume x is in exp, y is in unev
append
 (test (op null?) (reg exp))
 (branch (label append-done))
 (save exp)
 (save continue)
 (assign continue (label after-append))
 (goto (label append))
after-append
 (restore continue)
 (restore exp)
 (assign exp (op car) (reg exp))
 (assign val (op cons) (reg exp) (reg val))
 (goto (reg continue))
append-done
 (assign val (reg unev))
 (goto (reg continue))
 
;assume x is in exp, y is in unev
append!
  (assign argl (op last-pair) (reg exp))
  (perform (op set-car!) (reg argl) (reg unev))
  (assign val (reg exp))
  (goto (label continue))
