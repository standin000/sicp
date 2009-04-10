(define (analyze-amb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
	(if (null? choices)
	    (fail)
	    (let ((choice (list-ref choices (random (length choices)))))
	      (choice env
		      succeed
		      (lambda ()
			(try-next (delq choice choices)))))))
	(try-next cprocs))))
;Value: "analyze-amb --> #[compound-procedure 4 analyze-amb]"
(driver-loop)

;;; Amb-Eval input:
(define nouns '(noun student professor cat class))

;;; Amb-Eval input:
(define verbs '(verb studies lectures eats sleeps))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define articles '(article the a))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define adjectives '(adjective beautiful serious))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define adverbs '(adverb quickly peacefuly))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-sentence)
  (list 'sentence
	(parse-noun-phrase)
	(parse-verb-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-verb-phrase)
  (define (maybe-extend verb-phrase)
    (amb verb-phrase
	 (maybe-extend (list 'verb-phrase
			     verb-phrase
     			     (parse-word adverbs)))
	 (maybe-extend (list 'verb-phrase
			     verb-phrase
			     (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define prepositions '(prep for to in by with))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-prepositional-phrase)
  (list 'prep-phrase
	(parse-word prepositions)
	(parse-noun-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-simple-noun-phrase)
  (list 'simple-noun-phrase
	(parse-word articles)
	(amb (parse-word nouns)
	     (list 'adjective-phrase
		   (parse-word adjectives)
		   (parse-word nouns))
	     )
	))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-noun-phrase)
  (define (maybe-extend noun-phrase)
    (amb noun-phrase
	 (maybe-extend (list 'noun-phrase
			     noun-phrase
			     (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse-word word-list)
  (if (null? (cdr (cdr word-list)))
      (list (car word-list) (cadr word-list))
      (amb
       (list (car word-list) (cadr word-list))
       (parse-word (cons (car word-list) (cdr (cdr word-list))))
       )
      )
  )

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(parse-sentence)

;;; Starting a new problem 
;;; Amb-Eval value:
(sentence (noun-phrase (simple-noun-phrase (article a) (noun student)) (prep-phrase (prep with) (simple-noun-phrase (article the) (adjective-phrase (adjective serious) (noun cat))))) (verb lectures))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence (noun-phrase (simple-noun-phrase (article a) (noun student)) (prep-phrase (prep with) (simple-noun-phrase (article the) (adjective-phrase (adjective serious) (noun cat))))) (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb lectures) (adverb peacefuly)) (prep-phrase (prep for) (simple-noun-phrase (article the) (adjective-phrase (adjective beautiful) (noun student))))) (adverb quickly)) (adverb peacefuly)))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence (noun-phrase (simple-noun-phrase (article a) (noun student)) (prep-phrase (prep with) (simple-noun-phrase (article the) (adjective-phrase (adjective serious) (noun cat))))) (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb lectures) (adverb peacefuly)) (prep-phrase (prep for) (simple-noun-phrase (article the) (adjective-phrase (adjective beautiful) (noun student))))) (adverb quickly)) (adverb peacefuly)) (adverb quickly)))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
(sentence (noun-phrase (simple-noun-phrase (article a) (noun student)) (prep-phrase (prep with) (simple-noun-phrase (article the) (adjective-phrase (adjective serious) (noun cat))))) (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb-phrase (verb lectures) (adverb peacefuly)) (prep-phrase (prep for) (simple-noun-phrase (article the) (adjective-phrase (adjective beautiful) (noun student))))) (adverb quickly)) (adverb peacefuly)) (adverb quickly)) (adverb peacefuly)))

;;; Amb-Eval input:
;Quit!

