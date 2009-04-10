Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init 
			(map car seqs))
	    (accumulate-n op init
			  (map cdr seqs)))))
;Value: "accumulate-n --> #[compound-procedure 5 accumulate-n]"

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 4 accumulate]"

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
;Value: "s --> ((1 2 3) (4 5 6) (7 8 9) (10 11 12))"

(accumulate-n + 0 s)
;Value: (22 26 30)



