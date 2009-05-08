; process1              process2              flag
; test-and-set!                               false
; it is false try set!  test-and-set!         false
;                       it is false try set!  true
; continue run          continue run
; so it is wrong!