(define (do-init exp) (cadr exp))
(define (do-test exp) (caddr exp))
(define (do-command exp) (cdddr exp))

(define (do->let exp)
  (let ((binds (map (lambda (e) (list (car e) (cadr e))) (do-init exp)))
	(steps (map (lambda (e) (if (null? (cddr e)) (cadr e) (caddr e))) (do-init exp)))
	(test (car (do-test exp)))
	(exps (make-begin (cdr (do-test exp))))
	(commands (make-begin (do-command exp))))
    (list 'let 'mydo binds
	  (make-if test exps (append commands (list (cons 'mydo steps))))
	)
    )
  )

(2d-put!
 'eval
 'do
 (lambda (exp env)
   (eval (do->let exp) env)))

(define exp '(do ((vec 5)
     (i 0 (+ i 1)))
    ((= i 5) vec)
   i))

(eval '(do ((vec 5)
	    (i 0 (+ i 1)))
	   ((= i 5) vec)
	 (display i))
      the-global-environment)
;01234
;Value: 5

(eval '(let ((x '(1 3 5 7 9)))
	 (do ((x x (cdr x))
	      (sum 0 (+ sum (car x))))
	     ((null? x) sum)))
      the-global-environment)
;Value: 25

; I can not find syntax of for, while, until from MIT Scheme Reference Manual
; but I think it is easy for converting them to do.

