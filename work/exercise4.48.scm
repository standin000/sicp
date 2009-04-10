(driver-loop)


;;; Amb-Eval input:
(define nouns '(noun student professor cat class))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

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
  (require (not (null? *unparsed*)))
  (require (memq (car *unparsed*) (cdr word-list)))
  (let ((found-word (car *unparsed*)))
    (set! *unparsed* (cdr *unparsed*))
    (list (car word-list) found-word)))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define *unparsed* '())

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (parse input)
  (set! *unparsed* input)
  (let ((sent (parse-sentence)))
    (require (null? *unparsed*))
    sent))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(define (require p) (if (not p) (amb) '#f))

;;; Starting a new problem 
;;; Amb-Eval value:
ok

;;; Amb-Eval input:
(parse '(The beautiful professor lectures to the student in the class with the cat))

;;; Starting a new problem 
;;; Amb-Eval value:
(sentence (simple-noun-phrase (article the) (adjective-phrase (adjective beautiful) (noun professor))) (verb-phrase (verb-phrase (verb-phrase (verb lectures) (prep-phrase (prep to) (simple-noun-phrase (article the) (noun student)))) (prep-phrase (prep in) (simple-noun-phrase (article the) (noun class)))) (prep-phrase (prep with) (simple-noun-phrase (article the) (noun cat)))))

;;; Amb-Eval input:
(parse '(The professor lectures))

;;; Starting a new problem 
;;; Amb-Eval value:
(sentence (simple-noun-phrase (article the) (noun professor)) (verb lectures))

;;; Amb-Eval input:

;;; Starting a new problem 
;;; There are no more values of
(parse (quote (the serious professor lectures quickly)))

;;; Starting a new problem 
;;; Amb-Eval value:
(sentence (simple-noun-phrase (article the) (adjective-phrase (adjective serious) (noun professor))) (verb-phrase (verb lectures) (adverb quickly)))

;;; Amb-Eval input:
;Quit!

