(ev-application
 (save continue)
 (save env)
 (assign unev (op operands) (reg exp))
 (save operands)
 (assign exp (op operator) (reg exp))
 (assign exp (op actual-value) (reg exp)) ;add actual-value
 (assign continue (label ev-appl-did-operator))
 (goto (label eval-dispatch))
ev-appl-did-operator
 (restore unev) ; the operands
 (restore env)
 (assign proc (reg val)) ; the operator
 (test (op primitive-procedure?) (reg proc))
 (branch (label primitive-apply))
 (test (op compound-procedure?) (reg proc))
 (branch (label compound-apply))
 (goto (label unknown-procedure-type))
primitive-apply
 (assign continue (label primitive-apply-work))
 (goto (label ev-appl-did-operator))
compound-apply
 (assign continue (label compound-apply-work)) ; use continue to judge if argument need be delayed.
 (goto (label ev-appl-did-operator))
ev-appl-did-operator
 (save continue)
 (assign argl (op empty-arglist))
 (test (op no-operands?) (reg unev))
 (goto (reg continue))
 (save proc)
ev-appl-operand-loop
 (save argl)
 (assign exp (op first-operand) (reg unev))
 (test (op last-operand?) (reg unev))
 (branch (label ev-appl-last-arg))
 (save env)
 (save unev)
 (save continue)
 (test (op =) (reg continue) (label compound-apply-work)) ;It need delay not eval
 (branch (label delay-argument-1))
 (assign continue (label ev-appl-accumulate-arg))
 (assign exp (op actual-value) (reg exp))
 (goto (label eval-dispatch))
delay-argument-1
 (assign val (op delay-it) (reg exp)) ; Set delay value of exp in val 
ev-appl-accumulate-arg
 (restore continue)
 (restore unev)
 (restore env)
 (restore argl)
 (assign argl (op adjoin-arg) (reg val) (reg argl))
 (assign unev (op rest-operands) (reg unev))
 (goto (label ev-appl-operand-loop))
ev-appl-last-arg
 (save continue)
 (test (op =) (reg continue) (label compound-apply-work)) ;It need delay not eval
 (branch (label delay-argument-2))
 (assign continue (label ev-appl-accum-last-arg))
 (assign exp (op actual-value) (reg exp))
 (goto (label eval-dispatch))
delay-argument-2
 (assign val (op delay-it) (reg exp)) ; Set delay value of exp in val 
ev-appl-accum-last-arg
 (restore continue)
 (restore argl)
 (assign argl (op adjoin-arg) (reg val) (reg argl))
 (restore proc)
 (retore continue)
 (goto (label continue))
primitive-apply-work
 (assign val (op apply-primitive-procedure)
	 (reg proc)
	 (reg argl))
 (restore continue)
 (goto (reg continue))
compound-apply-work
 (assign unev (op procedure-parameters) (reg proc))
 (assign env (op procedure-environment) (reg proc))
 (assign env (op extend-environment)
	 (reg unev) (reg argl) (reg env))
 (assign unev (op procedure-body) (reg proc))
 (goto (label ev-sequence)))

(ev-if
 (save exp) ; save expression for later
 (save env)
 (save continue)
 (assign continue (label ev-if-decide))
 (assign exp (op if-predicate) (reg exp))
 (assign exp (op actual-value) (reg exp)) ;add actual-value
 (goto (label eval-dispatch))) ; evaluate the predicate

