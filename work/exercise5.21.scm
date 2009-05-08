;version a
;assume tree is in exp
count-leaves
  (test (op null?) (reg exp))
  (branch (label count-0-done))
  (test (op pair?) (reg exp))
  (branch (label count-recursive))
count-1-done
  (assign val (const 1))
  (restore continue)
  (goto (reg continue))
count-recursive  
  (save exp)
  (save continue)
  (assign continue (label after-recursive-1))
  (assign exp (op car) (reg exp))
  (goto (label count-leaves))
after-recursive-1
  (restore exp)
  (assign unev (reg val))
  (assign continue (label after-recursive-2))
  (assign exp (op cdr) (reg exp))
  (goto (label eval-dispatch))
after-recursive-2
  (assign val (op +) (reg unev) (reg val))
  (restore exp)
  (restore continue)
  (goto (reg continue))
count-0-done
  (assign val (const 0))
  (restore continue)
  (goto (reg continue))

;version b
;assume tree is in exp
count-leaves
  (assign unev (const 0))
count-iter
  (test (op null?) (reg exp))
  (branch (label count-done))
  (test (op pair?) (reg exp))
  (branch (label count-iterative))
count-1-done
  (assign val (op +) (reg unev) (const 1))
  (restore continue)
  (goto (reg continue))
count-iterative
  (save exp)
  (save continue)
  (assign exp (car exp))
  (assign continue (label after-count))
  (goto count-leaves)
after-count
  (restore continue)
  (restore exp)
  (assign exp (cdr exp))
  (assign unev (reg val))
  (goto count-leaves)
count-0-done
  (assign val (reg unev))
  (restore continue)
  (goto (reg continue))





