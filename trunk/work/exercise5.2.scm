(controller
 test-b
 (test (op >) (reg counter) (reg n))
 (branch (label factorial-done))
 (assign t (op *) (reg product) (reg counter))
 (assign product (reg t))
 (assign t (op +1) (reg counter))
 (assign counter (reg t))
 (goto (label test-b))
 factorial-done)