Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))
;Value: "fold-left --> #[compound-procedure 3 fold-left]"

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))
;Value: "fold-right --> #[compound-procedure 5 fold-right]"

(fold-right / 1 (list 1 2 3))
;Value: 1.5

(fold-left / 1 (list 1 2 3))
;Value: .16666666666666666

(fold-right list nil (list 1 2 3))
;Value: (1 (2 (3 #f)))

(fold-left list nil (list 1 2 3))
;Value: (((#f 1) 2) 3)

;op must satify that a op b = b op a: op is commutative function
;reference from code17
;((a op b) op c) = (a op (b op c)) works only for especial situation:
;there is not init parameters.






