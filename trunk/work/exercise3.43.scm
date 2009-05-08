;1. exchange1 will exchange account1 and account2, exchange2 will exchange
; account2 and account3 
;  account1     account2     account3
;     $10          $20          $30
;  exchange1 get difference $10  exchange2 get difference $10
;  finished exchange1
;     $20          $10          $30 
;  finished exchange2
;     $20          $20          $20
; However the sum is 60 still for every account is serialized and the sum
; of deposit and withdraw is equal.
;
;  account1     account2     account3
;     $10          $20          $30
;  exchange1 get difference $10  exchange2 get difference $10
;  change account1 in exchange1
;     $20          $20          $30
;  parallel excute change account2 in exchange1 and change account2 in exchange2
;     $20          $30          $30
;  change account3 in exchange2
;     $20          $30          $20
