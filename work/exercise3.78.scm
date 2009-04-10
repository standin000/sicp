; Maybe I learned differential equation in the university, but now I have
; no idea about solving this class equation now, :(.

(define (solve-2nd a b dt y0 dy0)
  (define dy (integral (delay ddy) dy0 dt))
  (define y (integral (delay dy) y0 dt))
  (define ddy (add-streams (scale-stream dy a)
			   (scale-stream y b)))
  y
  )

y'' - 2y' + y = 0's special root is e^x
(stream-ref (solve-2nd 2 -1 0.001 1 1) 1000)
;Value: 2.716923932235896

