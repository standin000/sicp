(driver-loop)

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Amb-Eval input:

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (owner daughter list)
  (if (null? list)
      false
      (if (eq? daughter (cadr (car list)))
	  (car (car list))
	  (owner daughter (cdr list))
	  )
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (puzzle)
  (let ((MrMorre (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Lorna)))
    (require (eq? (car MrMorre) 'MaryAnnMorre))
    (require (not (eq? (car MrMorre) 'Lorna)))
    (let ((SirBarnacle (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Gabrielle)))
      (require (eq? (car SirBarnacle) 'Melissa))
      (require (not (eq? (car SirBarnacle) 'Gabrielle)))
      (let ((MrHall (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Rosalind)))
	(require (not (eq? (car MrHall) 'Rosalind)))
	(require (not (member (car MrHall) (list (car MrMorre) (car SirBarnacle)))))
	(let ((ColoelDowning (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Melissa)))
	  (require (not (eq? (car ColoelDowning) 'Melissa)))
	  (require (not (member (car ColoelDowning) (list (car MrHall) (car MrMorre) (car SirBarnacle)))))
	  (let ((DrParker (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'MarryAnnMorre)))
	    (require (not (eq? (car DrParker) 'Gabrielle)))
	    (require (not (member (car DrParker) (list (car ColoelDowning) (car MrHall) (car MrMorre) (car SirBarnacle)))))
	    (require (eq? 'Gabrielle (owner (car DrParker) (list MrMorre SirBarnacle MrHall ColoelDowning DrParker))))
	    (list (list 'MrMorre MrMorre)
		  (list 'SirBarnacle SirBarnacle)
		  (list 'MrHall MrHall)
		  (list 'ColoelDowning ColoelDowning)
		  (list 'DrParker DrParker)
		  )
	    )
	  )
	)
      )
    )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(puzzle)

;;; Starting a new problem 
;;; Amb-Eval value:
((mrmorre (maryannmorre lorna)) (sirbarnacle (melissa gabrielle)) (mrhall (gabrielle rosalind)) (coloeldowning (lorna melissa)) (drparker (rosalind marryannmorre)))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(puzzle)

;;; Amb-Eval input:
;;so Lorna'father is ColoelDowning.
;;; Amb-Eval input:
(define (puzzle)
  (let ((MrMorre (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Lorna)))
;    (require (eq? (car MrMorre) 'MaryAnnMorre))
    (require (not (eq? (car MrMorre) 'Lorna)))
    (let ((SirBarnacle (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Gabrielle)))
      (require (eq? (car SirBarnacle) 'Melissa))
      (require (not (eq? (car SirBarnacle) 'Gabrielle)))
      (let ((MrHall (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Rosalind)))
	(require (not (eq? (car MrHall) 'Rosalind)))
	(require (not (member (car MrHall) (list (car MrMorre) (car SirBarnacle)))))
	(let ((ColoelDowning (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'Melissa)))
	  (require (not (eq? (car ColoelDowning) 'Melissa)))
	  (require (not (member (car ColoelDowning) (list (car MrHall) (car MrMorre) (car SirBarnacle)))))
	  (let ((DrParker (list (amb 'MaryAnnMorre 'Gabrielle 'Lorna 'Rosalind 'Melissa) 'MarryAnnMorre)))
	    (require (not (eq? (car DrParker) 'Gabrielle)))
	    (require (not (member (car DrParker) (list (car ColoelDowning) (car MrHall) (car MrMorre) (car SirBarnacle)))))
	    (require (eq? 'Gabrielle (owner (car DrParker) (list MrMorre SirBarnacle MrHall ColoelDowning DrParker))))
	    (list (list 'MrMorre MrMorre)
		  (list 'SirBarnacle SirBarnacle)
		  (list 'MrHall MrHall)
		  (list 'ColoelDowning ColoelDowning)
		  (list 'DrParker DrParker)
		  )
	    )
	  )
	)
      )
    )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(puzzle)

;;; Starting a new problem 
;;; Amb-Eval value:
((mrmorre (maryannmorre lorna)) (sirbarnacle (melissa gabrielle)) (mrhall (gabrielle rosalind)) (coloeldowning (lorna melissa)) (drparker (rosalind marryannmorre)))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((mrmorre (gabrielle lorna)) (sirbarnacle (melissa gabrielle)) (mrhall (maryannmorre rosalind)) (coloeldowning (rosalind melissa)) (drparker (lorna marryannmorre)))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((mrmorre (melissa lorna)) (sirbarnacle (melissa gabrielle)) (mrhall (gabrielle rosalind)) (coloeldowning (maryannmorre melissa)) (drparker (rosalind marryannmorre)))
try-again

;;; Amb-Eval value:
((mrmorre (melissa lorna)) (sirbarnacle (melissa gabrielle)) (mrhall (gabrielle rosalind)) (coloeldowning (lorna melissa)) (drparker (rosalind marryannmorre)))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(puzzle)

;;; Amb-Eval input:
;Quit!

;;there are 4 solutions if we are not told that Mary Ann's last name is Moore.


