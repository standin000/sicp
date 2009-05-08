; (fact 4)
;    stack                                        val
;    4, fact-done
;    3, after-fact, 4, fact-done
;    2, after-fact, 3, after-fact, 4, fact-done    1
;    3, after-fact, 4, fact-done                   2
;    4, fact-done                                  6
;                                                  24

; (fib 3) is more double complex than (fib 2)
; (fib 2)
;  stack                                           val     continue
;  2, fib-done                                             after-fib-1
;  1, fib-done                                      1      after-fib-2
;                                                   2      fib-done

