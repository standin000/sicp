Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define x (list (list 1 2) (list 3 4)))
;Value: "x --> ((1 2) (3 4))"

(define (reverse l)
  (if (null? (cdr l))
      (cons (car l) nil)
      (append (reverse (cdr l)) (cons (car l) nil)
      )
  )
)

(reverse x)
;Value: ((3 4) (1 2))


(define (deep-reverse l)
  (if (pair? l)
	  (append
	       (deep-reverse (cdr l))
	       (cons (deep-reverse (car l)) nil)
	   )
      l
   )
  )
;Value: "deep-reverse --> #[compound-procedure 37 deep-reverse]"


(deep-reverse 1)
;Value: 1

(deep-reverse '(1))
;Value: (1)

(deep-reverse '(1 2))
;Value: (2 1)

(deep-reverse '(1 2 3))
;Value: (3 2 1)

(deep-reverse x)
;Value: ((4 3) (2 1))

;reference from code17
(define (reverse l)
  (if (pair? l)
      (append (reverse (cdr l)) (cons (car l) nil))
      l
  )
)





