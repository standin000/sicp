; Ben Bitdiddle's method will explore n + (n - 1) + ... + 1 = n * (n - 1) / 2 possibilitys
; n = high - low
; Text's method will explore n * (n - 1) + (n - 1) * (n - 2) + ...+ 2 * 1 = 2 * ((n - 1) ^ 2 + (n - 3) ^ 2 + ... + 1 ^ 2))
; = 2 * (n^3 - n) / 6 = (n ^ 3 - n) / 3, just n is a even, it is similar when n is a odd.
; reference prove method
; 1^2 + 2^2 + .. n ^ 2 = n * (n + 1) * (2n + 1) / 6
; 2^2 - 1^2 + 4^2 - 3^2 +...+ n^2 - (n-1) ^ 2 = n * (n - 1) / 2; n is a even.
; => 1^2 + 3^2 + ... (n-1) ^ 2 = (n ^ 3 - n) / 3.
; Conclude: Ben's method is effcient than text's.
