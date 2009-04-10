(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(define (test s n)
  (define (inner-test k)
    (if (< k n)
	(begin
	  (display (stream-ref s k))
	  (display ",")
	  (inner-test (+ k 1))
	  )
	'done
	)
    )
  (inner-test 0)
  )
;Value: "test --> #[compound-procedure 8 test]"

(test (expand 1 7 10) 13)
1,4,2,8,5,7,1,4,2,8,5,7,1,
;Value: done

(test (expand 3 8 10) 5)
3,7,5,0,0,
;Value: done


