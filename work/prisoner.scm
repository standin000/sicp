;; 
;;  The play-loop procedure takes as its  arguments two prisoner's
;;  dilemma strategies, and plays an iterated game of approximately
;;  one hundred rounds.  A strategy is a procedure that takes
;;  two arguments: a history of the player's previous plays and 
;;  a history of the other player's previous plays.  The procedure
;;  returns either a "c" for cooperate or a "d" for defect.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (play-loop strat0 strat1)
  (define (play-loop-iter strat0 strat1 count history0 history1 limit)
    (cond ((= count limit) (print-out-results history0 history1 limit))
	  (else (let ((result0 (strat0 history0 history1))
		      (result1 (strat1 history1 history0)))
		  (play-loop-iter strat0 strat1 (+ count 1)
				  (extend-history result0 history0)
				  (extend-history result1 history1)
				  limit)))))
  (play-loop-iter strat0 strat1 0 the-empty-history the-empty-history
		  (+ 90 (random 21))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  The following procedures are used to compute and print
;;  out the players' scores at the end of an iterated game
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (print-out-results history0 history1 number-of-games)
  (let ((scores (get-scores history0 history1)))
    (newline)
    (display "Player 1 Score:  ")
    (display (* 1.0 (/ (car scores) number-of-games)))
    (newline)
    (display "Player 2 Score:  ")
    (display (* 1.0 (/ (cadr scores) number-of-games)))
    (newline)))

(define (get-scores history0 history1)
  (define (get-scores-helper history0 history1 score0 score1)
    (cond ((empty-history? history0)
	   (list score0 score1))
	  (else (let ((game (make-play (most-recent-play history0)
				       (most-recent-play history1))))
		  (get-scores-helper (rest-of-plays history0)
				     (rest-of-plays history1)
				     (+ (get-player-points 0 game) score0)
				     (+ (get-player-points 1 game) score1))))))
  (get-scores-helper history0 history1 0 0))

(define (get-player-points num game)
  (list-ref (get-point-list game) num))

(define *game-association-list*
  ;; format is that first sublist identifies the players' choices 
  ;; with "c" for cooperate and "d" for defect; and that second sublist 
  ;; specifies payout for each player
  '((("c" "c") (3 3))
    (("c" "d") (0 5))
    (("d" "c") (5 0))
    (("d" "d") (1 1))))

(define (get-point-list game)

  (cadr (extract-entry game *game-association-list*)))
;; note that you will need to write extract-entry

(define make-play list)

;problem 1
(define (extract-entry game game-association-list)
  (cond ((null? game-association-list) '())
	((equal? game (caar game-association-list))
	 (car game-association-list))
	(else
	 (extract-entry game (cdr game-association-list)))
	)
  )

(define a-play (make-play "c" "d"))
(extract-entry a-play *game-association-list*)
; => (("c" "d") (0 5))

(define the-empty-history '())

(define extend-history cons)
(define empty-history? null?)

(define most-recent-play car)
(define rest-of-plays cdr)

;; A sampler of strategies

(define (NASTY my-history other-history)
  "d")

(define (PATSY my-history other-history)
  "c")

(define (SPASTIC my-history other-history)
  (if (= (random 2) 0)
      "c"
      "d"))

(define (EGALITARIAN  my-history other-history)
  (define (count-instances-of test hist)
    (cond ((empty-history? hist) 0)
	  ((string=? (most-recent-play hist) test)
	   (+ (count-instances-of test (rest-of-plays hist)) 1))
	  (else (count-instances-of test (rest-of-plays hist)))))
  (let ((ds (count-instances-of "d" other-history))
	(cs (count-instances-of "c" other-history)))
    (if (> ds cs) "d" "c")))

(define (EYE-FOR-EYE my-history other-history)
  (if (empty-history? my-history)
      "c"
      (most-recent-play other-history)))

;problem 2
(define strat-list (list NASTY PATSY SPASTIC EGALITARIAN EYE-FOR-EYE))
;Basically, play-loop satisfy exchange law.
  (define (play-strat-helper strat strat-list)
    (if (null? strat-list)
	(display "cycle end\n")
	(begin
	  (display strat)
	  (newline)
	  (display (car strat-list))
	  (play-loop strat (car strat-list))
	  (newline)
	  (play-strat-helper strat (cdr strat-list))
	  )
	)
    )

(define (play-strat strat-list)
  (if (null? strat-list)
      (display "game end\n")
      (begin
	(play-strat-helper (car strat-list) strat-list)
	(play-strat (cdr strat-list))
	)
      )
  )
(play-strat strat-list)
; #<procedure NASTY (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  1.0
; Player 2 Score:  1.0

; #<procedure NASTY (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  5.0
; Player 2 Score:  0.0

; #<procedure NASTY (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  2.94059405940594
; Player 2 Score:  0.514851485148515

; #<procedure NASTY (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  1.03809523809524
; Player 2 Score:  0.990476190476191

; #<procedure NASTY (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  1.03636363636364
; Player 2 Score:  0.990909090909091

; cycle end
; #<procedure PATSY (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure PATSY (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  1.59183673469388
; Player 2 Score:  3.93877551020408

; #<procedure PATSY (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure PATSY (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; cycle end
; #<procedure SPASTIC (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  2.18367346938776
; Player 2 Score:  2.13265306122449

; #<procedure SPASTIC (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.76923076923077
; Player 2 Score:  1.62637362637363

; #<procedure SPASTIC (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  2.13684210526316
; Player 2 Score:  2.13684210526316

; cycle end
; #<procedure EGALITARIAN (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure EGALITARIAN (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; cycle end
; #<procedure EYE-FOR-EYE (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; cycle end
; game end

;Problem 3
(define (Egalitarian my-history other-history)
  (define (majority-loop cs ds hist)
    (cond ((empty-history? hist) 
	   (if (> ds cs) "d" "c"))
	   ((string=? (most-recent-play hist) "c")
	    (majority-loop (+ 1 cs) ds (rest-of-plays hist)))
	   (else(majority-loop cs (+ 1 ds) (rest-of-plays hist)))
	   )
    )
  (majority-loop 0 0 other-history)
  )

(play-loop Egalitarian NASTY)
; Player 1 Score:  0.990654205607477
; Player 2 Score:  1.03738317757009
; New version is better for it do not need walk down history list twice.

;Problem 4
(define (eye-for-two-eyes my-history other-history)
  (cond ((or (empty-history? other-history)
	    (empty-history? (rest-of-plays other-history)))
	 "c")
	((and (string=? (most-recent-play other-history) "d")
	      (string=? (most-recent-play (rest-of-plays other-history)) "d")
	      )
	 "d"
	 )
	(else "c")
	)
  )

(play-strat-helper eye-for-two-eyes strat-list)
; #<procedure eye-for-two-eyes (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  0.978723404255319
; Player 2 Score:  1.08510638297872

; #<procedure eye-for-two-eyes (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure eye-for-two-eyes (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  1.87155963302752
; Player 2 Score:  3.11009174311927

; #<procedure eye-for-two-eyes (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure eye-for-two-eyes (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; cycle end

; Problem 5
(define (make-eye-for-n-eyes n)
  (lambda (my-history other-history)
    (cond
     ((empty-history? my-history) "c")
     ((= n 1) (EYE-FOR-EYE my-history other-history))
     ((and
       (string=? (most-recent-play other-history) "d")
       (string=? ((make-eye-for-n-eyes (- n 1))
		  (rest-of-plays my-history)
		  (rest-of-plays other-history))
		 "d")
       )
      "d")
     (else "c")
     )
    )
  )
(play-loop eye-for-two-eyes NASTY)
; Player 1 Score:  0.981651376146789
; Player 2 Score:  1.07339449541284

(play-loop (make-eye-for-n-eyes 2) NASTY)
; Player 1 Score:  0.980769230769231
; Player 2 Score:  1.07692307692308

(play-strat-helper (make-eye-for-n-eyes 2) strat-list)
; #<procedure #f (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  0.981818181818182
; Player 2 Score:  1.07272727272727

; #<procedure #f (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure #f (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  1.8019801980198
; Player 2 Score:  3.08910891089109

; #<procedure #f (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure #f (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; cycle end

(play-strat-helper (make-eye-for-n-eyes 3) strat-list)
; #<procedure #f (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  0.967391304347826
; Player 2 Score:  1.1304347826087

; #<procedure #f (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure #f (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  1.82978723404255
; Player 2 Score:  3.58510638297872

; #<procedure #f (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; #<procedure #f (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  3.0
; Player 2 Score:  3.0

; Problem 6
(define (make-rotating-strategy strat0 strat1 freq1 freq2)
  (lambda (my-history other-history)
    (let ((n (remainder (length my-history) (+ freq1 freq2))))
      (if (<= n freq1)
	  (strat0 my-history other-history)
	  (strat1 my-history other-history)
	  )
      )
    )
  )

(play-strat-helper (make-rotating-strategy NASTY PATSY 2 3) strat-list)
; #<procedure #f (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  0.612244897959184
; Player 2 Score:  2.55102040816327

; #<procedure #f (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  4.2
; Player 2 Score:  1.2

; #<procedure #f (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  2.38888888888889
; Player 2 Score:  1.88888888888889

; #<procedure #f (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  0.636363636363636
; Player 2 Score:  2.59090909090909

; #<procedure #f (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  2.03296703296703
; Player 2 Score:  1.97802197802198

; Problem 7
(define (make-higher-order-spastic strat-list)
  (lambda (my-history other-history)
    (let ((n (remainder (length my-history) (length strat-list))))
      ((list-ref strat-list n)
       my-history other-history)
      )
    )
  )
(play-strat-helper (make-higher-order-spastic strat-list) strat-list)
; #<procedure #f (my-history other-history)>
; #<procedure NASTY (my-history other-history)>
; Player 1 Score:  0.727272727272727
; Player 2 Score:  2.09090909090909

; #<procedure #f (my-history other-history)>
; #<procedure PATSY (my-history other-history)>
; Player 1 Score:  3.52941176470588
; Player 2 Score:  2.20588235294118

; #<procedure #f (my-history other-history)>
; #<procedure SPASTIC (my-history other-history)>
; Player 1 Score:  2.09174311926605
; Player 2 Score:  2.59633027522936

; #<procedure #f (my-history other-history)>
; #<procedure EGALITARIAN (my-history other-history)>
; Player 1 Score:  3.67619047619048
; Player 2 Score:  1.96190476190476

; #<procedure #f (my-history other-history)>
; #<procedure EYE-FOR-EYE (my-history other-history)>
; Player 1 Score:  2.52475247524752
; Player 2 Score:  2.47524752475248

; cycle end

; Problem 8
(define (gentle strat gentleness-factor)
  (lambda (my-history other-history)
    (cond ((string=? "c" (strat my-history other-history))
	   "c")
	  ((< (random 1) gentleness-factor)
	   "c"
	   )
	  (else "d")
	  )
    )
  )

(define slightly-gentle-Nasty
  (gentle NASTY 0.1))

(define slightly-gentle-Eye-for-Eye
  (gentle EYE-FOR-EYE 0.1)
  )

(play-loop slightly-gentle-Nasty NASTY)
; Player 1 Score:  0.0
; Player 2 Score:  5.0

(play-loop slightly-gentle-Eye-for-Eye EYE-FOR-EYE)
; Player 1 Score:  3.0
; Player 2 Score:  3.0

;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; code to use in 3 player game
;;	    

(define *game-association-list*
 (list (list (list "c" "c" "c") (list 4 4 4))
       (list (list "c" "c" "d") (list 2 2 5))
       (list (list "c" "d" "c") (list 2 5 2))
       (list (list "d" "c" "c") (list 5 2 2))
       (list (list "c" "d" "d") (list 0 3 3))
       (list (list "d" "c" "d") (list 3 0 3))
       (list (list "d" "d" "c") (list 3 3 0))
       (list (list "d" "d" "d") (list 1 1 1))))
; Problem 9
(define (play-loop-3 strat0 strat1 strat2)
  (define (play-loop-iter strat0 strat1 strat2 count 
			  history0 history1 history2 limit)
    (cond ((= count limit) (print-out-results-3 history0 history1 history2 limit))
	  (else (let ((result0 (strat0 history0 history1 history2))
		      (result1 (strat1 history1 history0 history2))
		      (result2 (strat2 history2 history0 history1)))
		  (play-loop-iter strat0 strat1 strat2 (+ count 1)
				  (extend-history result0 history0)
				  (extend-history result1 history1)
				  (extend-history result2 history2)
				  limit)))))
  (play-loop-iter strat0 strat1 strat2 0 the-empty-history the-empty-history
		  the-empty-history (+ 90 (random 21))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  The following procedures are used to compute and print
;;  out the players' scores at the end of an iterated game
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (print-out-results-3 history0 history1 history2 number-of-games)
  (let ((scores (get-scores-3 history0 history1 history2)))
    (newline)
    (display "Player 1 Score:  ")
    (display (* 1.0 (/ (car scores) number-of-games)))
    (newline)
    (display "Player 2 Score:  ")
    (display (* 1.0 (/ (cadr scores) number-of-games)))
    (newline)
    (display "Player 3 Score:  ")
    (display (* 1.0 (/ (caddr scores) number-of-games)))
    (newline)))

(define (get-scores-3 history0 history1 history2)
  (define (get-scores-helper history0 history1 history2 score0 score1 score2)
    (cond ((empty-history? history0)
	   (list score0 score1 score2))
	  (else (let ((game (make-play (most-recent-play history0)
				       (most-recent-play history1)
				       (most-recent-play history2))))
		  (get-scores-helper (rest-of-plays history0)
				     (rest-of-plays history1)
				     (rest-of-plays history2)
				     (+ (get-player-points 0 game) score0)
				     (+ (get-player-points 1 game) score1)
				     (+ (get-player-points 2 game) score2))))))
  (get-scores-helper history0 history1 history2 0 0 0))

; Problem 10
(define (NASTY-3 my-history other-history-1 other-history-2)
  "d")

(define (PATSY-3 my-history other-history-1 other-history-2)
  "c")

(define (SPASTIC-3 my-history other-history-1 other-history-2)
  (if (= (random 2) 0)
      "c"
      "d"))

(play-loop-3 NASTY-3 PATSY-3 SPASTIC-3)
; Player 1 Score:  3.87128712871287
; Player 2 Score:  0.871287128712871
; Player 3 Score:  2.56435643564356

(define (tough-Eye-for-Eye my-history other-history-1 other-history-2)
  (cond ((empty-history? my-history) "c")
        ((or (string=? (most-recent-play other-history-1) "d")
	    (string=? (most-recent-play other-history-2) "d")
	    ) "d")
	(else "c")
	)
  )

(define (soft-Eye-for-Eye my-history other-history-1 other-history-2)
  (cond ((empty-history? my-history) "c")
        ((and (string=? (most-recent-play other-history-1) "d")
	    (string=? (most-recent-play other-history-2) "d")
	    ) "d")
	(else "c")
	)
  )

(play-loop-3 SPASTIC-3 tough-Eye-for-Eye soft-Eye-for-Eye)
; Player 1 Score:  2.58415841584158
; Player 2 Score:  3.02970297029703
; Player 3 Score:  2.07920792079208

; Problem 11
(define (make-combined-strategies strat0 strat1 combined-procedure)
  (lambda (my-history other-history-1 other-history-2)
    (let ((result1 (strat0 my-history other-history-1))
	  (result2 (strat1 my-history other-history-2)))
      (combined-procedure result1 result2)
      )
    )
  )

(play-loop-3
 soft-Eye-for-Eye
 (make-combined-strategies
  EYE-FOR-EYE EYE-FOR-EYE
  (lambda (r1 r2) (if (or (string=? r1 "d") (string=? r2 "d"))"d" "c")))
 (make-combined-strategies
  EYE-FOR-EYE Egalitarian
  (lambda (r1 r2) (if (= (random 2) 0) r1 r2)))
 )
; Player 1 Score:  4.0
; Player 2 Score:  4.0
; Player 3 Score:  4.0

;most-recent-play is the first element of history list, and the first play
;is the end element of history list.
(define (make-history-summary my-history other-history-1 other-history-2)
  (define (make-history-summary-helper
	   my-history other-history-1 other-history-2
	   r1 r2 r3 r4 r5 r6)
    (cond ((null? other-history-1) 
	   (list (list r1 r2 (+ r1 r2)) (list r3 r4 (+ r3 r4)) (list r5 r6 (+ r5 r6))))
	  ((and (string=? (most-recent-play other-history-1) "c")
		(string=? (most-recent-play other-history-2) "c")
		)
	   (if (string=? (most-recent-play my-history) "c")
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		(+ r1 1) r2 r3 r4 r5 r6)
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		 r1 (+ r2 1) r3 r4 r5 r6)
	       )
	   )
	  ((and (string=? (most-recent-play other-history-1) "d")
		(string=? (most-recent-play other-history-2) "d")
		)
	   (if (string=? (most-recent-play my-history) "c")
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		r1 r2 r3 r4 (+ r5 1) r6)
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		 r1 r2 r3 r4 r5 (+ r6 1))
	       )
	   )
	  (else
	   (if (string=? (most-recent-play my-history) "c")
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		r1 r2 (+ r3 1) r4 r5 r6)
	       (make-history-summary-helper
		(rest-of-plays my-history) (rest-of-plays other-history-1) (rest-of-plays other-history-2)
		 r1 r2 r3 (+ r4 1) r5 r6)
	       )
	   )
	  )
    )
  (make-history-summary-helper my-history (rest-of-plays other-history-1)
			       (rest-of-plays other-history-2) 0 0 0 0 0 0)
  )

(define summary (make-history-summary
		 (list "c" "c" "d" "d" "c" "d" "c" "c")
		 (list "c" "c" "c" "d" "d" "c" "d" "c")
		 (list "c" "c" "d" "d" "d" "c" "c" "c")
		 ))

(display summary)
;((3 0 3) (1 1 2) (0 2 2))
;((2 1 3) (1 1 2) (1 1 2))

; Problem 13
(define (get-probability-of-c summary)
  (list
   (if (= (caddr (car summary)) 0)
       '()
       (/ (car (car summary)) (caddr (car summary)))
       )
   (if (= (caddr (cadr summary)) 0)
       '()
       (/ (car (cadr summary)) (caddr (cadr summary)))
       )
   (if (= (caddr (caddr summary)) 0)
       '()
       (/ (car (caddr summary)) (caddr (caddr summary)))
       )
   )
  )

(define summary (make-history-summary
		 (list "c" "c" "c" "c") ;hist-0
		 (list "d" "d" "d" "c") ;hist-1
		 (list "d" "d" "c" "c"))) ;hist-2

(get-probability-of-c summary)
; (1 1 1)

(define new-summary (make-history-summary
		     (list "c" "c" "c" "d" "c")
		     (list "d" "c" "d" "d" "c")
		     (list "d" "c" "c" "c" "c")))
(get-probability-of-c new-summary)
; (0.5 1 ())

;; in expected-values: #f = don't care 
;;                      X = actual-value needs to be #f or X 

;(not '()) is #f in guile, so I use null? instead of not.
(define (test-entry expected-values actual-values) 
   (cond ((null? expected-values) (null? actual-values)) 
         ((null? actual-values) #f) 
         ((or (null? (car expected-values)) 
              (null? (car actual-values)) 
              (= (car expected-values) (car actual-values))) 
          (test-entry (cdr expected-values) (cdr actual-values))) 
         (else #f)))

(define (is-he-a-fool? hist0 hist1 hist2) 
   (test-entry (list 1 1 1) 
               (get-probability-of-c 
                (make-history-summary hist0 hist1 hist2))))

(define (could-he-be-a-fool? hist0 hist1 hist2)
  (test-entry (list 1 1 1)
              (map (lambda (elt) 
                      (cond ((null? elt) 1)
                            ((= elt 1) 1)  
                            (else 0)))
                   (get-probability-of-c (make-history-summary hist0 
                                                               hist1
                                                               hist2)))))

(define (is-he-soft-Eye hist0 hist1 hist2)
   (test-entry (list 1 1 0) 
               (get-probability-of-c 
                (make-history-summary hist0 hist1 hist2))
	       )
   )

(define (dont-tolerate-fools hist0 hist1 hist2)
  (cond ((< (length hist0) 10) "c")
	((= (length hist0) 10)
	 (if (and (is-he-a-fool? hist1 hist0 hist2)
		  (is-he-a-fool? hist2 hist0 hist1))
	     "d"
	     "c"
	     )
	 )
	(else (most-recent-play hist0))
	)
  )

(play-loop-3 dont-tolerate-fools PATSY-3 PATSY-3)
; Player 1 Score:  4.90566037735849
; Player 2 Score:  2.18867924528302
; Player 3 Score:  2.18867924528302

