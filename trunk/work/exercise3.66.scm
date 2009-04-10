; if the pair (i,j) belongs to Part I, i = 1, j = 1, It is 1st paris.
; if the pair (i,j) belongs to Part II, i = 1, It is 1 + (j - 1) * 2 - 1 = (2j - 2)nd paris, so 
; there is 197 paris precede the pair (1, 100).
; if the pair (i,j) belongs to Part III, suppose it is the Nnd paris in (pairs (stream-cdr integers)
(stream-cdr integers)) sequence , it is (N * 2 + 1)nd pairs in (pairs integers integers) sequence.
; let the pair (99, 100) is N(1)nd pairs in (pairs integers integers),  (99, 100) is N(2)nd pairs in 
; (pairs (stream-cdr integers) (stream-cdr integers)) and so on.
; N(1) = 2*N(2) + 1 = 2 * ( 2*N(3) + 1) + 1 = ... 2*...(2*N(99) + 1)+1)...+1)
; the pair (99,100) belongs to Part II in N(99), so N(99) = 2;
; => N(1) = (GetN 99 1 2) = 950737950171172051122527404031
(define (GetN N count sum)
  (if (< count N)
      (GetN N (+ count 1) (+ (* 2 sum) 1))
      sum
      )
  )

; use the same way, the pair (100 100) is (GetN 100 1 1) = 1267650600228229401496703205375nd pairs.



