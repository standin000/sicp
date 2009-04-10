(define (analyze-sequence exps)
  (define (execute-sequence procs env)
    (cond ((null? (cdr procs)) ((car procs) env))
	  (else ((car procs) env)
		(execute-sequence (cdr procs) env))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
	(error "Empty sequence -- ANALYZE"))
    (lambda (env) (execute-sequence procs env))))

; Although in Alyssa' method, the individual expressions in 
; the sequence have been analyzed, the analyzed result of 
; sequence is not saved, it only saves the last expression
; of sequence. so if the sequence has jst one expression, it
; is OK, but for a sequence with two expression, it wastes
; analyzed result of first expression