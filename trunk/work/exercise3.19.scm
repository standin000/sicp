(define (smart-iscycle list)
  (define (iscycle-helper list-p n)
    (cond
     ((null? list-p) #f)
     ((smart-IsIn list-p list n) #t)
     (else (iscycle-helper (cdr list-p) (+ n 1)))
     )
    )
  (iscycle-helper list 0)
  )
;Although I want remove parmater n for reduce space, it seems be impossible

(define (smart-IsIn x unite n)
  (cond 
   ((null? unite) #f)
   ((= n 0) #f)
   ((eq? x unite) #t)
   (else (smart-IsIn x (cdr unite) (- n 1)))
   )
  )

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(smart-iscycle z)
;#t

(smart-iscycle '(a b c))
;#f

(smart-iscycle (append '(a b c) z))
;#t


