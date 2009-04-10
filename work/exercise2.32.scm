Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x)) rest)))))
;Value: "subsets --> #[compound-procedure 7 subsets]"

(subsets '(1 2 3))
;Value: (#f (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;the lambda function append (car s) into every element in rest.

