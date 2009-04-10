Scheme saved on Saturday January 29, 2000 at 8:21:45 PM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Win32 1.5
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

(define (make-interval a b) (cons a b))
;Value: "make-interval --> #[compound-procedure 2 make-interval]"

(define (lower-bound z) (car z))
;Value: "lower-bound --> #[compound-procedure 3 lower-bound]"

(define (upper-bound z) (cdr z))
;Value: "upper-bound --> #[compound-procedure 4 upper-bound]"


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
;Value: "add-interval --> #[compound-procedure 5 add-interval]"

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
;Value: "mul-interval --> #[compound-procedure 6 mul-interval]"

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
;Value: "div-interval --> #[compound-procedure 7 div-interval]"

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))
;Value: "par1 --> #[compound-procedure 9 par1]"

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))
;Value: "par2 --> #[compound-procedure 10 par2]"

(lower-bound (par1 (make-interval 1 2) (make-interval 3 4)))
;Value: .5

(upper-bound (par1 (make-interval 1 2) (make-interval 3 4)))
;Value: 2.

(lower-bound (par2 (make-interval 1 2) (make-interval 3 4)))
;Value: .75

(upper-bound (par2 (make-interval 1 2) (make-interval 3 4)))
;Value: 1.3333333333333333

;let assume all integers is positive
;alias div-interval div
;alias mul-interval mul
;alias add-interval add
;alias make-interval make
;alias lower-bound L
;alias upper-bound U
;first (mul one x) => x					
;      (div one x) => (mul one (make (/ 1 (U x))
;                                    (/ 1 (L x))
;                  => (make (/ 1 (U x) (/ 1 (L x)))  
;reduce (par1 x1 x2)=>(div 
;                       (make (* (L x1) (L x2)) (* (U x1) (U x2)))
;                       (make (+ (L x1) (L x2)) (+ (U x1) (U x2)))
;=>(mul (make (* (L x1) (L x2)) (* (U x1) (U x2)))
;       (make (/ 1 (+ (U x1) (U x2))) (/ 1 (+ (L x1) (L x2)))))
;
;=>(make (/ (* (L x1) (L x2)) (+ (U x1) (U x2)))
;        (/ (* (U x1) (U x2)) (+ (L x1) (L x2))))

;reduce (par2 x1 x2)=>(div one (add 
;                                (make (/ 1 (U x1) (/ 1 (L x1))))
;                                (make (/ 1 (U x2) (/ 1 (L x2)))))) 
;=>(div one (make (/ (+ (U x1) (U x2)) (* (U x1) (U x2)))
;                 (/ (+ (L x1) (L x2)) (* (L x1) (L x2)))))
;=>(make (/ (* (L x1) (L x2)) (+ (L x1) (L x2)))
;        (/ (* (U x1) (U x2)) (+ (U x1) (U x2)))

(div-interval (make-interval 1 2) (make-interval 1 2))
;Value: (.5 . 2.)
;for A/A is not equal 1, so the reduced mean of this question is ;not right.

(div-interval (make-interval 1 2) (make-interval 3 4))
;Value: (.25 . .6666666666666666)

(define (make-center-percent c p)
  (cons (- c (* c  p)) (+ c (* c  p))))
;Value: "make-center-percent --> #[compound-procedure 12 make-center-percent]"

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: "center --> #[compound-procedure 13 center]"

(define (percent i)
  (/ (- (upper-bound i) (lower-bound i))
     (+ (lower-bound i) (upper-bound i)))
  )
;Value: "percent --> #[compound-procedure 14 percent]"

(div-interval (make-center-percent 1 0.01) (make-interval 1 0.01))
;Value: (.99 . 101.)

;alias make-center-percent make-cp
;(div (make-cp c p) (make-cp c p))
;(mul (make-cp c p) (make (/ 1 (+ c (* c p)))
;                         (/ 1 (- c (* c p)))))
;(make (/ (- c (* c p)) (+ c (* c p)))
;      (/ (+ c (* c p)) (- c (* c p))))
;so if p is small, the result is approach 1








