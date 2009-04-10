Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'real-part) 
	   (* r (cos a)))
	  ((eq? op 'imag-part)
	   (* r (sin a)))
	  ((eq? op 'magnitude) r)
	  ((eq? op 'angle) a)
	  (else
	   (error "Unknown op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)
;Value: "make-from-mag-ang --> #[compound-procedure 3 make-from-mag-ang]"

(define (apply-generic op arg) (arg op))
;Value: "apply-generic --> #[compound-procedure 4 apply-generic]"

(define (real-part z) (apply-generic 'real-part z))
;Value: "real-part --> #[compound-procedure 8 real-part]"

(define (imag-part z) (apply-generic 'imag-part z))
;Value: "imag-part --> #[compound-procedure 7 imag-part]"

(define (magnitude z) (apply-generic 'magnitude z))
;Value: "magnitude --> #[compound-procedure 6 magnitude]"

(define (angle z) (apply-generic 'angle z))
;Value: "angle --> #[compound-procedure 5 angle]"

(real-part (make-from-mag-ang 4 0.2))
;Value: 3.9202663113649665

(imag-part (make-from-mag-ang 4 0.2))
;Value: .7946773231802449

(magnitude (make-from-mag-ang 4 0.2))
;Value: 4

(angle (make-from-mag-ang 4 0.2))
;Value: .2

