Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

;a:
;It get corresponding operator from type tag-operator table and operates at operand and variable.
;so we can add or delete row in the table without modify the function body.
;Because number? and variable? both are judgement not a value, they can not be added into the table
;simply.

;It seems MIT scheme do not have get or put primitive, so I use
;2d-get, 2d-put! instead, but they do not work in guile
;b:
(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((2d-get 'deriv (operator exp)) (operands exp)
					   var))))
;Value: "deriv --> #[compound-procedure 5 deriv]"

(define (operator exp) (car exp))
;Value: "operator --> #[compound-procedure 6 operator]"

(define (operands exp) (cdr exp))
;Value: "operands --> #[compound-procedure 7 operands]"

;Although variable? exists in scheme but it does not equal to symbol?
(define (variable? x) (symbol? x))
;Value: "variable? --> #[compound-procedure 49 variable?]"

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: "same-variable? --> #[compound-procedure 50 same-variable?]"

(define (=number? exp num)
  (and (number? exp) (= exp num)))
;Value: "=number? --> #[compound-procedure 51 =number?]"

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))
;Value: "make-sum --> #[compound-procedure 54 make-sum]"

(define (addend s) (car s))
;Value: "addend --> #[compound-procedure 55 addend]"

(define (augend s) (cadr s))
;Value: "augend --> #[compound-procedure 56 augend]"

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))
;Value: "make-product --> #[compound-procedure 57 make-product]"

(define (multiplier s) (car s))
;Value: "multiplier --> #[compound-procedure 58 multiplier]"

(define (multiplicand s) (cadr s))
;Value: "multiplicand --> #[compound-procedure 59 multiplicand]"

(define (install-deriv-package)
  ;; internal procedures
  
  (define (make-sum-deriv exp var)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))
  
  (define (make-product-deriv exp var)
    (make-sum
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))
  
  ;; interface to the rest of the system
  (2d-put! 'deriv '+ make-sum-deriv)
  (2d-put! 'deriv '* make-product-deriv)
  'done)
;Value: "install-deriv-package --> #[compound-procedure 37 install-deriv-package]"

(install-deriv-package)
;Value: done

(deriv '(+ 1 x) 'x)
;Value: 1

(deriv '(+ (* x 3) (* x 2)) 'x)
;Value: 5

;c:
(define (install-exp-package)
  (define (base s) (car s))
  
  (define (exponent s) (cadr s))
  
  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
	  ((=number? e 1) b)
	  ((and (number? b) (number? e)) (** b e))
	  (else (list '** b e))))
  
  (define (** b e)
    (exp (* e (log b))))
  (define (make-exponentiation-deriv exp var)
    (make-product 
     (exponent exp)
     (make-product 
      (make-exponentiation (base exp) (- (exponent exp) 1))
      (deriv (base exp) var))))
  (2d-put! 'deriv '** make-exponentiation-deriv)
  'done
  )
;Value: "install-exp-package --> #[compound-procedure 52 install-exp-package]"

(install-exp-package)
;Value: done

(deriv '(** x 3) 'x)
;Value: (* 3 (** x 2))

(deriv '(+ (** x 3) (** x 2)) 'x)
;Value: (+ (* 3 (** x 2)) (* 2 x))

;d:
;modify the sequence of parameter when calling put.

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((2d-get (operator exp) 'deriv) (operands exp) var))))
;Value: "deriv --> #[compound-procedure 60 deriv]"

(define (install-exp-package)
  (define (base s) (car s))
  
  (define (exponent s) (cadr s))
  
  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
	  ((=number? e 1) b)
	  ((and (number? b) (number? e)) (** b e))
	  (else (list '** b e))))
  
  (define (** b e)
    (exp (* e (log b))))
  (define (make-exponentiation-deriv exp var)
    (make-product 
     (exponent exp)
     (make-product 
      (make-exponentiation (base exp) (- (exponent exp) 1))
      (deriv (base exp) var))))
  (2d-put! '** 'deriv make-exponentiation-deriv)
  'done
  )
;Value: "install-exp-package --> #[compound-procedure 61 install-exp-package]"

(install-exp-package)
;Value: done

(deriv '(** x 3) 'x)
;Value: (* 3 (** x 2))
