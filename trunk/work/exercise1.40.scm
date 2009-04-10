Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
;Value: "deriv --> #[compound-procedure 3 deriv]"

(define dx 0.00001)
;Value: "dx --> .00001"

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
;Value: "newton-transform --> #[compound-procedure 4 newton-transform]"

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
;Value: "newtons-method --> #[compound-procedure 5 newtons-method]"

(define tolerance 0.00001)
;Value: "tolerance --> .00001"

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: "fixed-point --> #[compound-procedure 6 fixed-point]"

(- 4 2 1)
;Value: 1

(define (cubic a b c)
  (lambda (x)
    (/ (- 0
	  (* x x x)
	  (* a x x)
	  c)
       b)
    )
  )
;Value: "cubic --> #[compound-procedure 10 cubic]"

(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: "average-damp --> #[compound-procedure 12 average-damp]"

(define (average a b)
  (/ (+ a b) 2))
;Value: "average --> #[compound-procedure 13 average]"

(fixed-point (average-damp (cubic 1 2 3)) 1)
;Value: -1.2756819171482803


(define (formula a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)
    )
  )
;Value: "formula --> #[compound-procedure 14 formula]"

;Value: "formula --> #[compound-procedure 11 formula]"
((formula 1 2 3) -1.2756819171482803)
;Value: 1.2407658691593326e-6

(define cubic formula)
;Value: "cubic --> #[compound-procedure 14 formula]"

((define cubic formula)

(newtons-method (cubic 1 2 3) 1)
;Value: -1.2756822036498454

((formula 1 2 3) -1.2756822036498454)
;Value: 4.935607478273596e-12











