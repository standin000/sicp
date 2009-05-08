; if exchange is a serilized procedure and its withdraw is also
; a serilized procedure, it makes a deadlock, exchange requires
; a mutex and withdraw will continue to require the mutex before
; exchange release the mutex, withdraw is in the exchange procedure.