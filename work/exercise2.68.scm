(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left) (symbols right))
	(+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
		  (make-code-tree
		   (make-leaf 'B 2)
		   (make-code-tree (make-leaf 'D 1)
				   (make-leaf 'C 1)))))

(define sample-message '(A D A B B C A))


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-helper tree)
    (if (leaf? tree)
	(if (eq? symbol (symbol-leaf tree))
	    '()
	    '(ng)); it should use a mechanism like Common lisp condition system
	(let ((left-result (encode-symbol-helper (left-branch tree)))
	      (right-result (encode-symbol-helper (right-branch tree))))
	  (cond ((not (member 'ng left-result)) (cons 0 left-result))
		((not (member 'ng right-result)) (cons 1 right-result))
		(else '(ng))))))
  (let ((result (encode-symbol-helper tree)))
    (if (member 'ng result)
	(error "Bad Symbol" symbol)
	result)))


(encode sample-message sample-tree)
;Value: (0 1 1 0 0 1 0 1 0 1 1 1 0)

(encode '(E) sample-tree)
;Bad Symbol e
;Type D to debug error, Q to quit back to REP loop: q
;Quit!

