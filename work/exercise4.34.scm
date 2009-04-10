;; if pair are implemented in my evaluator, I can only use lambda 
;; funtion; if pair are implemented in eval procedure as a special 
;; form, maybe I can use other method.

;; the function of displaying lazy pair can not be in force-it
;; procedure for it should always be lambda function during 
;; evaluation process.

(eval '(define (cons x y)
	 (lambda (m) 'lazy-pair (m x y)))
      the-global-environment)

;; I can not find a method to judge wheather a list like integers
;; is infinite. a list like ones can be judged easily.
(define (display-it obj)
  (define (display-it-count obj count)
    (if (and (compound-procedure? obj)
	     (lazy-pair-procedure? obj))
	(let ((car-part 
	       (force-it
		(apply obj '((lambda (p q) p)) the-global-environment)))
	      (cdr-part
	       (force-it
		(apply obj '((lambda (p q) q)) the-global-environment))))
	  (cons
	   car-part
	   (if (or (eq? cdr-part obj)
		   (= count 10))
	       '(...)
	       (display-it-count cdr-part (+ count 1))
	       )
	   )
	  )
	obj
	)
    )
  (display-it-count obj 0)
  )

(define (lazy-pair-procedure? exp)
  (and (pair? (first-operand
	    (procedure-body exp)))
       (eq? (cadr (first-operand
	    (procedure-body exp)))
	   'lazy-pair)
       )
  )

(display-it (actual-value '(cons 'a 'b) the-global-environment))
; => (a . b)

(display-it (actual-value '(cons 'c (cons 'a 'b)) the-global-environment))
; => (c a . b)

(define (text-of-quotation exp env)
  (if (or (symbol? (cadr exp)) (null? (cadr exp)))
      (cadr exp)
      (make-procedure '(m) 
		      (list 
		      ''lazy-pair
		       (list 'm 
			     (list 'quote (car (cadr exp)))
			     (list 'quote (cdr (cadr exp)))))
		      env)
      )
  )

(display-it (actual-value ''(a b c) the-global-environment))
; => (a b c)

(display-it (actual-value '(car '(a b c)) the-global-environment))
; => a

(eval '(define ones (cons 1 ones)) the-global-environment)

(eval '(define (add-lists list1 list2)
	 (cond ((null? list1) list2)
	       ((null? list2) list1)
	       (else (cons (+ (car list1) (car list2))
			   (add-lists (cdr list1) (cdr list2))))))
      the-global-environment)

(eval '(define integers (cons 1 (add-lists ones integers)))
      the-global-environment)

(display-it (actual-value 'ones the-global-environment))
; => (1 ...)

(eval '(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
      the-global-environment
      )

(actual-value '(list-ref integers 17)
      the-global-environment)
; => 18

(display-it (actual-value 'integers the-global-environment))
; => (1 2 3 4 5 6 7 8 9 10 11 ...)
