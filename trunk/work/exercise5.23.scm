(ev-cond
 (assign exp (op cond->if) (reg exp))
 (goto (label eval-dispatch)))

(ev-let
 (assign exp (op let->combination) (reg exp))
 (goto (label eval-dispatch)))