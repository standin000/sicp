;           guess----------------good-enough?
;             |              |
;             X improve      |
;             |              |
;             X improve->t   X t->guess
;             |              |
;             t--------------
;
(controller
 sqrt
 (test (op good-enough?) (reg guess))
 (branch (label sqrt-done))
 (assign t (op improve) (reg guess))
 (assign guess (reg t))
 (goto (label sqrt))
 sqrt-done)

(controller
  sqrt
  (assign t1 (op square) (reg guess))
  (assign t2 (op -) (reg t1) (reg x))
  (assign t1 (op abs) (reg t2))
  (test (op <) (reg t1) (const 0.001))
  (branch (label sqrt-done))
  (assign t1 (op /) (reg x) (reg guess))
  (assign t2 (op average) (reg t1) (reg guess))
  (assign guess (reg t2))
  (goto (label sqrt))
  sqrt-done)
