(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
	(adjoin-set (make-leaf (car pair) ; symbol
			       (cadr pair)) ; frequency
		    (make-leaf-set (cdr pairs))))))

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

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))

(define (successive-merge leaf-set)
  (cond ((null? leaf-set) '())
	 ((null? (cdr leaf-set)) (car leaf-set))
	(else
	 (successive-merge 
	  (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                      (cddr leaf-set))))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

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

(define huffman-tree
  (generate-huffman-tree '((a 2) (na 16) (boom 1) (Sha 3) (Get 2) (yip 9)
			  (job 2) (Wah 1))))

(define message '(Get a job
		  Sha na na na na na na na na
		  Get a job
		  Sha na na na na na na na na
		  Wah yip yip yip yip yip yip yip yip yip
		  Sha boom))

(encode message huffman-tree)
;Value: (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

(length (encode message huffman-tree))
;Value: 84

;If we use fixed-length code for the eight-symbol alphabet, we need 3 bits
;for each symbol, so we need 36*3 = 108 bits to encode the song.
