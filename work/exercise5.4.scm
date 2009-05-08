;     0-----=
;           |  
;   val<-X--n---------      stack
; ^  |      |         ^      |^
; |  |      |         |      ||
; |  X*     X -1      X    continue---controller
; <--||     |         |      ^      ^
;     b     X         |      |      |
;           |         |  after-expt expt-done
;           t---------- 

(controller
 expt
 (assign continue (label expt-done))
 expt-loop
 (test (op =) (reg n) (const 0))
 (branch (label base-base))
 (save continue)
 (assign n (op -) (reg n) (const 1))
 (assign continue (label after-expt))
 (goto (label expt-loop))
 after-expt
 (restore continue)
 (assign val (op *) (reg val) (reg b))
 (goto (reg continue))
 base-base
 (assign val (const 1))
 (goto (reg continue))
 expt-done)

; product-<--X---counter-------=
;  | ^              |    ^      |
;  X*|              X-1  X      0
;  ||-              |----|
;  b               
(controller
 expt
 (test (op =) (reg counter) (const 0))
 (branch (label expt-done))
 (assign counter (op -) (reg counter) (const -))
 (assign product (op *) (reg product) (reg b))
 (goto (label expt))
 expt-done)
 
