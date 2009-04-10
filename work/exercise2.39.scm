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
;Value: "fold-left --> #[compound-procedure 2 fold-left]"

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))
;Value: "fold-right --> #[compound-procedure 3 fold-right]"

(define (reverse sequence)
  (fold-right (lambda (x y) 
		      (append y (list x))
		)
	      nil sequence)
  )
;Value: "reverse --> #[compound-procedure 23 reverse]"

(reverse (list 1 2 3 4))
;Value: (4 3 2 1)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
;Value: "reverse --> #[compound-procedure 7 reverse]"

(reverse (list 1 2 3 4))
;Value: (4 3 2 1)
