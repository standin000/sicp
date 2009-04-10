(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var)
			(multiplicand exp))))
	(else
	 (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))

(deriv '(x + (3 * (x + (y + 2)))) 'x)
;;; Evaluating in current module (guile-user)
; => 4

(deriv '((x * y) * (x + 3)) 'x)
;;; Evaluating in current module (guile-user)
; => ((x * y) + (y * (x + 3)))

(define (sum? x)
  (if (null? (cdr x))
      #f
      (and (pair? x)
	   (or (eq? (cadr x) '+)
	       (sum? (cddr x))
	       )
	   )
      )
  )

(define (addend s) 
  (let ((t-addend (car s))
	(t-augend (augend s))
	)
    (if (eq? (cadr s) '+)
	t-addend
	(list t-addend '* (addend t-augend))
	)
;     (if (pair? t-augend)
; 	(if (eq? (cadr t-augend) '+)
; 	    (list t-addend '* (car t-augend))
; 	    (list t-addend '* (addend (cddr s))); '* (augend (cddr s)))
; 	    )
; 	t-addend
; 	)
    )
  )

(define (augend s) 
  (if (null? (cdddr s))
      (caddr s)
      (cddr s)
      )
  )

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) 
  (if (null? (cdddr p))
      (caddr p)
      (cddr p)
      )
  )

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))

(deriv '(x + 3 * (x + y + 2)) 'x)
;;; Evaluating in current module (guile-user)
; => 4

(deriv '(x + 3 + 4 * (x + y + 2)) 'x)
;;; Evaluating in current module (guile-user)
; => 5

(deriv '(x + 3 + 4 * (x * y + 2)) 'x)
;;; Evaluating in current module (guile-user)
; => (1 + (4 * y))

(deriv '(x + 3 + 4 * (x + y * 2)) 'x)
;;; Evaluating in current module (guile-user)
; => 5
