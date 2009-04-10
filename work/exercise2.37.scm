Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init 
			(map car seqs))
	    (accumulate-n op init
			  (map cdr seqs)))))
;Value: "accumulate-n --> #[compound-procedure 2 accumulate-n]"

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: "accumulate --> #[compound-procedure 3 accumulate]"

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
;Value: "dot-product --> #[compound-procedure 5 dot-product]"

(dot-product '(1 2) '(3 4))
;Value: 11

(define (matrix-*-vector m v)
  (map 
   (lambda (x)
     (dot-product x v)) m))
;Value: "matrix-*-vector --> #[compound-procedure 9 matrix-*-vector]"

(matrix-*-vector '((1 2) (3 4)) '(5 6))
;Value: (17 39)

(define (transpose mat)
  (accumulate-n 
   (lambda (x y)
     (if (pair? x)
	 (append x y)
	 (cons x y)))
   nil mat)
  )
;Value: "transpose --> #[compound-procedure 27 transpose]"

(transpose '((1 2) (3 4)))
;Value: ((1 3) (2 4))

(transpose '((1 2 5) (3 4 6)))
;Value: ((1 3) (2 4) (5 6))


(transpose '((1 2 5) (3 4 6) (7 8 9)))
;Value: ((1 3 7) (2 4 8) (5 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v)
	   (matrix-*-vector cols v))
	 m)
    )
  )
;Value: "matrix-*-matrix --> #[compound-procedure 29 matrix-*-matrix]"

(matrix-*-matrix
 '((1 2 3) (2 3 4) (3 4 5))
 '((2 3 4) (3 4 5) (4 5 6)))
;Value: ((20 26 32) (29 38 47) (38 50 62))




