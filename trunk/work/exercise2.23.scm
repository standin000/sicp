Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (for-each f items)
  (if (pair? items)
      (begin
       (f (car items))
       (for-each f (cdr items))
       )
      )
  )
;Value: "for-each --> #[compound-procedure 9 for-each]"

(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88))

57
321
88
;Value: #[unspecified-return-value]














