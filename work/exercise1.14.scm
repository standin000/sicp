; Defines: kinds of coins is k and the smallest coin is m1, the biggest coin is mk.

; space:
; the order of growth of the space is the longest path in the tree approximates (k + n / m),
; so it is O(n)

; step:
; 1. number of steps for (cc n 1) approximates 3n/m1 is O(n)
; 2. (cc n 2)
; = (cc (n - m2) 2) + (cc n 1)
; = (cc (n - 2*m2) 2) + (cc (n - m2) 1) + (cc n 1)
; = (cc (n - n/m2*m2) 2) +...+ (cc (n - m2) 1) + (c n 1)
; = [sigma](cc n-x*m2 1) (0<=x<=n/m2,1)
; = [sigma](cc x*m2 1)(n/m2<=x<=0,-1)
; = 3*m2/m1*[sigma]x(n/m2=<=0,-1)
; = 3/(2*m1*m2)*(n^2+m2^2*n);1+2+...n = (n+1)n/2
; => O(n^2)
; 4. (cc n 3)=> O(n^3)(1^2+ 2^2+... + n^2 = n(n+1)(2n+1)/6)
; 5. continue induction=> (cc n 5) is O(n^5) 