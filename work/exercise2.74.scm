Scheme saved on Thursday January 27, 2000 at 10:40:14 AM
  Release 7.5.1
  Microcode 11.165
  Runtime 14.180
  Edwin 3.99
  6.001 15.30

;You are in an interaction window of the Edwin editor.
;Type C-h for help.  C-h m will describe some commands.
;Package: (student)

;a
;division's file must use (2d-put! 'name 'devision-personal-file record)
;to structure information.

(2d-put! 'John 'SR1 '(1000 A-Street))
;Value: #f

(define get-record
  (lambda (name personal-file)
    (2d-get name personal-file)
    )
  )
;Value: "get-record --> #[compound-procedure 6 get-record]"

(get-record 'John 'SR1)
;Value: (1000 a-street)

;b
;record should be structured by list and it first element must be salary.
(define get-salary
  (lambda (record)
    (car record)
    )
  )
;Value: "get-salary --> #[compound-procedure 7 get-salary]"

(get-salary (get-record 'John 'SR1))
;Value: 1000

;c
(define find-employee-record
  (lambda (name files)
    (if (null? files)
	'()
	(cons
	 (get-record name (car files))
	 (find-employee-record name (cdr files))
	 )
	)
    )
  )
;Value: "find-employee-record --> #[compound-procedure 8 find-employee-record]"

(2d-put! 'John 'SR2 '(2000 B-Street))
;Value: #[unspecified-return-value]

(find-employee-record 'John '(SR1 SR2))
;Value: ((1000 a-street) (2000 b-street))

;d:
;nothing.