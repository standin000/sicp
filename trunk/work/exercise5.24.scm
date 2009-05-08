(ev-cond
 (assign exp (op cond-clauses) (reg exp))
ev-cond-loop
 (assign unev (op first) (reg exp))
 (test (op cond-else-clause?) (reg unev))
 (branch (label ev-cond-else))
 (save env)
 (save continue)
 (assign continue (label ev-cond-decide))
 (save exp)
 (assign exp (op cond-predicate) (reg unev))
 (goto (label eval-dispatch))
ev-cond-decide
 (restore exp)
 (restore continue)
 (restore env)
 (test (op true?) (reg val))
 (branch (label ev-cond-next))
 (assign unev (op cond-actions) (reg unev))
 (save continue)
 (goto (label ev-sequence))
ev-cond-next
 (assign exp (op rest) (reg exp))
 (goto (label ev-cond-loop))
ev-cond-else
 (assign unev (op cond-actions) (reg unev))
 (save continue)
 (goto (label ev-sequence)))

