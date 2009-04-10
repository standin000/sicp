;;; Warmup Exercise 1
;;; It returns my location, a instance of place class.
;;; EXIT,EXIT-TOWARDS, ADD-EXIT and messages which can be sent to named-object
;;; class and container class.

;;; Warmup Exercise 2

;;; root-object
;;;     |-------------------------|
;;; named-object              container
;;;     |   |----------|---------||   |
;;;   thing          exit       Place |
;;;     |                             |
;;; mobile-thing                      |
;;;     ||----------------------------|---------|
;;;   person                                  spell
;;;     |------------------|
;;; autonomous-person    avator
;;;     |--------------|                     
;;; hall-monitor     troll    

;;; Warmup Exercise 3
;;; Reference Warmup Exercise 3.jpg
;;; Warmup Exercise 4
;;; thing: blackboard, lovely-trees, flag-pole, 
;;; mobile-thing: tons-of-code, problem-set, recitation-problem, sicp
;;; engineering-book, diploma.
;;; it is detemined by create time.

;;; Warmup Exercise 5
;;; Reference Warmup Exercise 5.jpg
;;; Warmup Exercise 6
(setup 'Plato)
;;Value: ready

(ask (ask me 'location) 'name)
;;Value: 10-250

(ask me 'look-around)

;You are in 10-250 
;You are not holding anything. 
;You see stuff in the room: slug-spell recitation-problem problem-set blackboard 
;There are no other people around you. 
;The exits are in directions: up down 
;;Value: ok

(ask me 'take (thing-named 'problem-set))

;At 10-250 plato says -- I take problem-set from 10-250 
;;Value: (instance #[compound-procedure 2 handler])

(ask me 'go 'down)

;plato moves from 10-250 to lobby-10 
;At lobby-10 plato says -- Hi mr-bigglesworth 
;--- the-clock Tick 0 --- 
;ben-bitdiddle moves from barker-library to 10-250 
;ben-bitdiddle moves from 10-250 to lobby-10 
;At lobby-10 ben-bitdiddle says -- Hi plato mr-bigglesworth 
;At lobby-10 ben-bitdiddle says -- I take problem-set from plato 
;At lobby-10 plato says -- I lose problem-set 
;At lobby-10 plato says -- Yaaaah! I am upset! 
;alyssa-hacker moves from 34-301 to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- Hi registrar 
;alyssa-hacker moves from edgerton-hall to legal-seafood 
;course-6-frosh moves from stata-center to stata-center 
;course-6-frosh moves from stata-center to stata-center 
;course-6-frosh moves from stata-center to stata-center 
;At stata-center course-6-frosh says -- I take sicp from stata-center 
;lambda-man moves from barker-library to 10-250 
;dr-evil moves from grendels-den to lobby-10 
;At lobby-10 dr-evil says -- Hi ben-bitdiddle plato mr-bigglesworth 
;dr-evil moves from lobby-10 to building-13 
;dr-evil moves from building-13 to edgerton-hall 
;At edgerton-hall dr-evil says -- Hi registrar 
;At edgerton-hall dr-evil says -- What are you doing still up? Everyone back to their rooms! 
;At edgerton-hall registrar goes home to edgerton-hall 
;mr-bigglesworth moves from lobby-10 to lobby-7 
;mr-bigglesworth moves from lobby-7 to student-center 
;At student-center mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from bexley to baker 
;At baker grendel 's belly rumbles 
;registrar moves from edgerton-hall to building-13 
;;Value: #t

(ask me 'look-around)

;You are in lobby-10 
;You are not holding anything. 
;You see stuff in the room: slug-spell 
;You see other people: ben-bitdiddle 
;The exits are in directions: south north west down up 
;;Value: ok

(ask me 'take (thing-named 'slug-spell))

;At lobby-10 plato says -- I take slug-spell from lobby-10 
;;Value: (instance #[compound-procedure 3 handler])

(ask me 'go 'north)

;plato moves from lobby-10 to building-13 
;At building-13 plato says -- Hi registrar 
;--- the-clock Tick 1 --- 
;ben-bitdiddle moves from lobby-10 to lobby-7 
;ben-bitdiddle moves from lobby-7 to lobby-10 
;alyssa-hacker moves from legal-seafood to great-court 
;alyssa-hacker moves from great-court to lobby-10 
;At lobby-10 alyssa-hacker says -- Hi ben-bitdiddle 
;alyssa-hacker moves from lobby-10 to great-court 
;course-6-frosh moves from stata-center to stata-center 
;course-6-frosh moves from stata-center to stata-center 
;lambda-man moves from 10-250 to barker-library 
;dr-evil moves from edgerton-hall to building-13 
;At building-13 dr-evil says -- Hi plato registrar 
;dr-evil moves from building-13 to lobby-10 
;At lobby-10 dr-evil says -- Hi ben-bitdiddle 
;At lobby-10 dr-evil says -- What are you doing still up? Everyone back to their rooms! 
;At lobby-10 ben-bitdiddle goes home to barker-library 
;mr-bigglesworth moves from student-center to bexley 
;mr-bigglesworth moves from bexley to student-center 
;mr-bigglesworth moves from student-center to lobby-7 
;At lobby-7 mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from baker to bexley 
;At bexley grendel 's belly rumbles 
;registrar moves from building-13 to lobby-10 
;At lobby-10 registrar says -- Hi dr-evil 
;At lobby-10 registrar takes a bite out of dr-evil 
;At lobby-10 dr-evil says -- Ouch! 2 hits is more than I want! 
;;Value: #t

(ask me 'look-around)

;You are in building-13 
;You are holding: slug-spell 
;You see stuff in the room: slug-spell 
;There are no other people around you. 
;The exits are in directions: north south 
;;Value: ok

(ask me 'drop (thing-named 'slug-spell))

;There is more than one thing named slug-spell here. Picking one of them. 
;At building-13 plato says -- I drop slug-spell at building-13 
;;Value: (instance #[compound-procedure 4 handler])

(ask me 'look-around)

;You are in building-13 
;You are holding: slug-spell 
;You see stuff in the room: slug-spell 
;There are no other people around you. 
;The exits are in directions: north south 
;;Value: ok

(ask me 'go 'north)

;plato moves from building-13 to edgerton-hall 
;--- the-clock Tick 2 --- 
;ben-bitdiddle moves from barker-library to 10-250 
;At 10-250 ben-bitdiddle says -- I take recitation-problem from 10-250 
;alyssa-hacker moves from great-court to legal-seafood 
;alyssa-hacker moves from legal-seafood to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- Hi plato 
;alyssa-hacker moves from edgerton-hall to legal-seafood 
;course-6-frosh moves from stata-center to stata-center 
;At stata-center course-6-frosh says -- I take boil-spell from stata-center 
;lambda-man moves from barker-library to 10-250 
;At 10-250 lambda-man says -- Hi ben-bitdiddle 
;At 10-250 lambda-man says -- I take problem-set from ben-bitdiddle 
;At 10-250 ben-bitdiddle says -- I lose problem-set 
;At 10-250 ben-bitdiddle says -- Yaaaah! I am upset! 
;dr-evil moves from lobby-10 to lobby-7 
;At lobby-7 dr-evil says -- Hi mr-bigglesworth 
;dr-evil moves from lobby-7 to lobby-10 
;At lobby-10 dr-evil says -- Hi registrar 
;dr-evil moves from lobby-10 to great-court 
;At great-court dr-evil says -- Grrr... When I catch those students... 
;mr-bigglesworth moves from lobby-7 to student-center 
;mr-bigglesworth moves from student-center to lobby-7 
;At lobby-7 mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from bexley to baker 
;At baker grendel 's belly rumbles 
;registrar moves from lobby-10 to building-13 
;;Value: #t

(ask me 'look-around)

;You are in edgerton-hall 
;You are holding: slug-spell 
;You see stuff in the room: slug-spell 
;There are no other people around you. 
;The exits are in directions: north up south 
;;Value: ok

(ask me 'go 'up)

;plato moves from edgerton-hall to 34-301 
;--- the-clock Tick 3 --- 
;ben-bitdiddle moves from 10-250 to lobby-10 
;ben-bitdiddle moves from lobby-10 to great-court 
;At great-court ben-bitdiddle says -- Hi dr-evil 
;At great-court ben-bitdiddle says -- I try but cannot take lovely-trees 
;alyssa-hacker moves from legal-seafood to edgerton-hall 
;alyssa-hacker moves from edgerton-hall to building-13 
;At building-13 alyssa-hacker says -- Hi registrar 
;alyssa-hacker moves from building-13 to lobby-10 
;course-6-frosh moves from stata-center to stata-center 
;course-6-frosh moves from stata-center to stata-center 
;course-6-frosh moves from stata-center to 34-301 
;At 34-301 course-6-frosh says -- Hi plato 
;lambda-man moves from 10-250 to lobby-10 
;At lobby-10 lambda-man says -- Hi alyssa-hacker 
;dr-evil moves from great-court to legal-seafood 
;mr-bigglesworth moves from lobby-7 to lobby-10 
;At lobby-10 mr-bigglesworth says -- Hi lambda-man alyssa-hacker 
;mr-bigglesworth moves from lobby-10 to building-13 
;At building-13 mr-bigglesworth says -- Hi registrar 
;At building-13 mr-bigglesworth says -- What are you doing still up? Everyone back to their rooms! 
;At building-13 registrar goes home to edgerton-hall 
;grendel moves from baker to bexley 
;At bexley grendel 's belly rumbles 
;registrar moves from edgerton-hall to legal-seafood 
;At legal-seafood registrar says -- Hi dr-evil 
;;Value: #t

(ask me 'look-around)

;You are in 34-301 
;You are holding: slug-spell 
;You see stuff in the room: slug-spell 
;You see other people: course-6-frosh 
;The exits are in directions: east up down 
;;Value: ok

(ask me 'go 'up)

;plato moves from 34-301 to eecs-hq 
;--- the-clock Tick 4 --- 
;ben-bitdiddle moves from great-court to legal-seafood 
;At legal-seafood ben-bitdiddle says -- Hi registrar dr-evil 
;At legal-seafood ben-bitdiddle says -- I take slug-spell from legal-seafood 
;alyssa-hacker moves from lobby-10 to 10-250 
;alyssa-hacker moves from 10-250 to lobby-10 
;At lobby-10 alyssa-hacker says -- Hi lambda-man 
;alyssa-hacker moves from lobby-10 to great-court 
;course-6-frosh moves from 34-301 to eecs-hq 
;At eecs-hq course-6-frosh says -- Hi plato 
;course-6-frosh moves from eecs-hq to eecs-ug-office 
;course-6-frosh moves from eecs-ug-office to eecs-hq 
;At eecs-hq course-6-frosh says -- Hi plato 
;At eecs-hq course-6-frosh says -- I take slug-spell from eecs-hq 
;lambda-man moves from lobby-10 to grendels-den 
;dr-evil moves from legal-seafood to edgerton-hall 
;dr-evil moves from edgerton-hall to building-13 
;At building-13 dr-evil says -- Hi mr-bigglesworth 
;At building-13 dr-evil says -- What are you doing still up? Everyone back to their rooms! 
;At building-13 mr-bigglesworth goes home to lobby-10 
;mr-bigglesworth moves from lobby-10 to lobby-7 
;mr-bigglesworth moves from lobby-7 to student-center 
;mr-bigglesworth moves from student-center to lobby-7 
;At lobby-7 mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from bexley to student-center 
;At student-center grendel 's belly rumbles 
;registrar moves from legal-seafood to great-court 
;At great-court registrar says -- Hi alyssa-hacker 
;;Value: #t

(ask me 'look-around)

;You are in eecs-hq 
;You are holding: slug-spell 
;There is no stuff in the room. 
;You see other people: course-6-frosh 
;The exits are in directions: up west down 
;;Value: ok

(ask me 'drop (thing-named 'slug-spell))

;There is more than one thing named slug-spell here. Picking one of them. 
;At eecs-hq plato says -- I drop slug-spell at eecs-hq 
;;Value: (instance #[compound-procedure 6 handler])

(ask me 'look-around)

;You are in eecs-hq 
;You are not holding anything. 
;You see stuff in the room: slug-spell 
;You see other people: course-6-frosh 
;The exits are in directions: up west down 
;;Value: ok

;;; Computer Exercise 1
;;;1
(setup 'plato)
;;Value: ready

(show me)
;INSTANCE (instance #[compound-procedure 2 handler])
; TYPE: (avatar person mobile-thing thing named-object root container)
; HANDLER: #[compound-procedure 2 handler]
; TYPE: avatar
; (methods (look-around #[compound-procedure 5])
;         (go #[compound-procedure 4])
;         (die #[compound-procedure 3]))
;  Parent frame: #[environment 6]
;  person-part:  #[compound-procedure 7 handler]
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 2 handler])
;    name:         plato
;    birthplace:   (instance #[compound-procedure 8 handler])
;;Value: instance

(show #@7)
; HANDLER: #[compound-procedure 7 handler]
; TYPE: person
; (methods (strength #[compound-procedure 14])
;         (health #[compound-procedure 13])
;         (say #[compound-procedure 12])
;         (have-fit #[compound-procedure 11])
;         (people-around #[compound-procedure 10])
;         ...)
;  Parent frame:      #[environment 15]
;  mobile-thing-part: #[compound-procedure 16 handler]
;  container-part:    #[compound-procedure 17 handler]
;  health:            3
;  strength:          1
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 2 handler])
;    name:         plato
;    birthplace:   (instance #[compound-procedure 8 handler])
;;Value: handler

(show #@16)
; HANDLER: #[compound-procedure 16 handler]
; TYPE: mobile-thing
; (methods (location #[compound-procedure 22])
;         (change-location #[compound-procedure 21])
;         (enter-room #[compound-procedure 20])
;         (leave-room #[compound-procedure 19])
;         (creation-site #[compound-procedure 18]))
;  Parent frame: #[environment 23]
;  thing-part:   #[compound-procedure 24 handler]
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 2 handler])
;    name:         plato
;    location:     (instance #[compound-procedure 8 handler])
;;Value: handler

(show #@24)
; HANDLER: #[compound-procedure 24 handler]
; TYPE: thing
; (methods (install #[compound-procedure 28])
;         (location #[compound-procedure 27])
;         (destroy #[compound-procedure 26])
;         (emit #[compound-procedure 25]))
;  Parent frame: #[environment 29]
;  named-part:   #[compound-procedure 30 handler]
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 2 handler])
;    name:         plato
;    location:     (instance #[compound-procedure 8 handler])
;;Value: handler

;;;2
(show (ask me 'location))
;INSTANCE (instance #[compound-procedure 8 handler])
; TYPE: (place container root named-object)
; HANDLER: #[compound-procedure 8 handler]
; TYPE: place
; (methods (exits #[compound-procedure 33])
;         (exit-towards #[compound-procedure 32])
;         (add-exit #[compound-procedure 31]))
;  Parent frame:   #[environment 34]
;  named-part:     #[compound-procedure 35 handler]
;  container-part: #[compound-procedure 36 handler]
;  exits:          ((instance #[compound-procedure 38 handler])
;                 (instance #[compound-procedure 37 handler]))
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 8 handler])
;    name:         10-250
;;Value: instance

(show #@36)
; HANDLER: #[compound-procedure 36 handler]
; TYPE: container
; (methods (things #[compound-procedure 42])
;         (have-thing? #[compound-procedure 41])
;         (add-thing #[compound-procedure 40])
;         (del-thing #[compound-procedure 39]))
;  Parent frame: #[environment 43]
;  root-part:    #[compound-procedure 44 handler]
;  things:       ((instance #[compound-procedure 2 handler])
;               (instance #[compound-procedure 48 handler])
;               (instance #[compound-procedure 47 handler])
;               (instance #[compound-procedure 46 handler])
;               (instance #[compound-procedure 45 handler]))
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 8 handler])
;;Value: handler

;;;3
(ask me 'look-around)

;You are in 10-250 
;You are not holding anything. 
;You see stuff in the room: slug-spell recitation-problem problem-set blackboard 
;There are no other people around you. 
;The exits are in directions: up down 
;;Value: ok

(ask me 'go 'down)

;plato moves from 10-250 to lobby-10 
;--- the-clock Tick 0 --- 
;ben-bitdiddle moves from grendels-den to lobby-10 
;At lobby-10 ben-bitdiddle says -- Hi plato 
;ben-bitdiddle moves from lobby-10 to 10-250 
;ben-bitdiddle moves from 10-250 to barker-library 
;At barker-library ben-bitdiddle says -- Hi lambda-man 
;alyssa-hacker moves from great-court to graduation-stage 
;At graduation-stage alyssa-hacker says -- I take boil-spell from graduation-stage 
;course-6-frosh moves from baker to bexley 
;course-6-frosh moves from bexley to baker 
;At baker course-6-frosh says -- Hi grendel 
;lambda-man moves from barker-library to 10-250 
;lambda-man moves from 10-250 to barker-library 
;At barker-library lambda-man says -- Hi ben-bitdiddle 
;At barker-library lambda-man says -- I take slug-spell from barker-library 
;dr-evil moves from lobby-7 to student-center 
;At student-center dr-evil says -- Hi mr-bigglesworth 
;dr-evil moves from student-center to lobby-7 
;dr-evil moves from lobby-7 to student-center 
;At student-center dr-evil says -- Hi mr-bigglesworth 
;At student-center dr-evil says -- What are you doing still up? Everyone back to their rooms! 
;At student-center mr-bigglesworth goes home to student-center 
;mr-bigglesworth moves from student-center to lobby-7 
;At lobby-7 mr-bigglesworth says -- I take boil-spell from lobby-7 
;grendel moves from baker to bexley 
;grendel moves from bexley to baker 
;At baker grendel says -- Hi course-6-frosh 
;registrar moves from stata-center to stata-center 
;At stata-center registrar 's belly rumbles 
;;Value: #t

;;;show location variable of mobile-thing
(show (#@22))
;INSTANCE (instance #[compound-procedure 50 handler])
; TYPE: (place container root named-object)
; HANDLER: #[compound-procedure 50 handler]
; TYPE: place
; (methods (exits #[compound-procedure 53])
;         (exit-towards #[compound-procedure 52])
;         (add-exit #[compound-procedure 51]))
;  Parent frame:   #[environment 54]
;  named-part:     #[compound-procedure 55 handler]
;  container-part: #[compound-procedure 56 handler]
;  exits:          ((instance #[compound-procedure 61 handler])
;                 (instance #[compound-procedure 60 handler])
;                 (instance #[compound-procedure 59 handler])
;                 (instance #[compound-procedure 58 handler])
;                 (instance #[compound-procedure 57 handler]))
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 50 handler])
;    name:         lobby-10
;;Value: instance

;;;show location variable of mobile-thing
(show (#@27))
;INSTANCE (instance #[compound-procedure 8 handler])
; TYPE: (place container root named-object)
; HANDLER: #[compound-procedure 8 handler]
; TYPE: place
; (methods (exits #[compound-procedure 33])
;         (exit-towards #[compound-procedure 32])
;         (add-exit #[compound-procedure 31]))
;  Parent frame:   #[environment 34]
;  named-part:     #[compound-procedure 35 handler]
;  container-part: #[compound-procedure 36 handler]
;  exits:          ((instance #[compound-procedure 38 handler])
;                 (instance #[compound-procedure 37 handler]))
;    Parent frame: global-environment
;    self:         (instance #[compound-procedure 8 handler])
;    name:         10-250
;;Value: instance

;;;4
;;;The value of super class's self variable does not change, it
;;;always point to #@2, avatar itself

;;;Computer Exercise 2

(define (person self name birthplace)
 (let ((mobile-thing-part (mobile-thing self name birthplace))
       (container-part    (container self))
       (health            3)
       (strength          1))
   (make-handler
    'person
    (make-methods
     'STRENGTH (lambda () strength)
     'HEALTH (lambda () health)
     'SAY
     (lambda (list-of-stuff)
	(ask screen 'TELL-ROOM (ask self 'location)
	     (append (list "At" (ask (ask self 'LOCATION) 'NAME)
			   (ask self 'NAME) "says --")
		     list-of-stuff))
	'SAID-AND-HEARD)
     'HAVE-FIT
     (lambda ()
	(ask self 'SAY '("Yaaaah! I am upset!"))
	'I-feel-better-now)
       
     'PEOPLE-AROUND        ; other people in room...
     (lambda ()
	(delq self (find-all (ask self 'LOCATION) 'PERSON)))
       
     'STUFF-AROUND         ; stuff (non people) in room...
     (lambda ()
	(let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
	       (stuff (filter (lambda (x) (not (ask x 'IS-A 'PERSON))) in-room)))
	  stuff))
       
     'PEEK-AROUND          ; other people's stuff...
     (lambda ()
	(let ((people (ask self 'PEOPLE-AROUND)))
	  (fold-right append '() (map (lambda (p) (ask p 'THINGS)) people))))
    
     'TAKE
     (lambda (thing)
	(cond ((ask self 'HAVE-THING? thing)  ; already have it
	       (ask self 'SAY (list "I am already carrying"
				    (ask thing 'NAME)))
	       #f)
	      ((or (ask thing 'IS-A 'PERSON)
		   (not (ask thing 'IS-A 'MOBILE-THING)))
	       (ask self 'SAY (list "I try but cannot take"
				    (ask thing 'NAME)))
	       #F)
	      (else
	       (let ((owner (ask thing 'LOCATION)))
		 (ask self 'SAY (list "I take" (ask thing 'NAME) 
				      "from" (ask owner 'NAME)))
		 (if (ask owner 'IS-A 'PERSON)
		     (ask owner 'LOSE thing self)
		     (ask thing 'CHANGE-LOCATION self))
		 thing))))
       
     'LOSE
     (lambda (thing lose-to)
	(ask self 'SAY (list "I lose" (ask thing 'NAME)))
	(ask self 'HAVE-FIT)
	(ask thing 'CHANGE-LOCATION lose-to))
       
     'DROP
     (lambda (thing)
	(ask self 'SAY (list "I drop" (ask thing 'NAME)
			     "at" (ask (ask self 'LOCATION) 'NAME)))
	(ask thing 'CHANGE-LOCATION (ask self 'LOCATION)))
     
     'GO-EXIT
     (lambda (exit)
	(ask exit 'USE self))
       
     'GO
     (lambda (direction) ; symbol -> boolean
	(let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	  (if (and exit (ask exit 'IS-A 'EXIT))
	      (ask self 'GO-EXIT exit)
	      (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			  (list "No exit in" direction "direction"))
		     #F))))
     'SUFFER
     (lambda (hits perp)
	(ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	(set! health (- health hits))
	(if (<= health 0) (ask self 'DIE perp))
	health)
       
     'DIE          ; depends on global variable "death-exit"
     (lambda (perp)
	(for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
		  (ask self 'THINGS))
	(ask screen 'TELL-WORLD
	     '("An earth-shattering, soul-piercing scream is heard..."))
	(ask self 'DESTROY))
     
     'ENTER-ROOM
     (lambda ()
	(let ((others (ask self 'PEOPLE-AROUND)))
	  (if (not (null? others))
	      (ask self 'SAY (cons "Hi" (names-of others)))))
	#T)

    'HAS-A
    (lambda (thing)
      (define (has-a things)
	 (if (null? things)
	     #f
	     (if (ask (car things) 'is-a thing) 
		 (car things)
		 (has-a (cdr things))
		 )
	     )
	 )
      (has-a (ask container-part 'THINGS))
      )

    'HAS-A-THING-NAMED
    (lambda (thing-named)
      (define (has-a-thing-named things)
	 (if (null? things)
	     #f
	     (if (equal? 
		  thing-named 
		  (ask (car things) 'NAME))
		 (car things)
		 (has-a-thing-named (cdr things))
		 )
	     )
	 )
      (has-a-thing-named (ask container-part 'THINGS))
      ))
    mobile-thing-part container-part)))
;;Value: "person --> #[compound-procedure 93 person]"

(setup 'plato)
;;Value: ready

(ask me 'look-around)

;You are in baker 
;You are not holding anything. 
;You see stuff in the room: boil-spell tons-of-code 
;You see other people: lambda-man 
;The exits are in directions: east 
;;Value: ok

(ask me 'take (thing-named 'boil-spell))

;At baker plato says -- I take boil-spell from baker 
;;Value: (instance #[compound-procedure 94 handler])

(ask me 'has-a 'spell)
;;Value: (instance #[compound-procedure 94 handler])

(ask me 'has-a-thing-named 'boil-spell)
;;Value: (instance #[compound-procedure 94 handler])

(ask me 'has-a-thing-named 'slug-spell)
;;Value: #f

(ask me 'has-a 'troll)
;;Value: #f

;;; Computer Exercise 3
(define (avatar self name birthplace)
 (let ((person-part (person self name birthplace)))
   (make-handler
    'avatar
    (make-methods
     'LOOK-AROUND          ; report on world around you
     (lambda ()
	(let* ((place (ask self 'LOCATION))
	       (exits (ask place 'EXITS))
	       (other-people (ask self 'PEOPLE-AROUND))
	       (my-stuff (ask self 'THINGS))
	       (stuff (ask self 'STUFF-AROUND)))
	  (ask screen 'TELL-WORLD (list "You are in" (ask place 'NAME)))
	  (ask screen 'TELL-WORLD
	       (if (null? my-stuff)
		   '("You are not holding anything.")
		   (append '("You are holding:") (names-of my-stuff))))
	  (ask screen 'TELL-WORLD
	       (if (null? stuff)
		   '("There is no stuff in the room.")
		   (append '("You see stuff in the room:") (names-of stuff))))
	  (ask screen 'TELL-WORLD
	       (if (null? other-people)
		   '("There are no other people around you.")
		   (append '("You see other people:") (names-of other-people))))
	  (ask screen 'TELL-WORLD
	       (if (not (null? exits))
		   (append '("The exits are in directions:") (names-of exits))
		   ;; heaven is only place with no exits
		   '("There are no exits... you are dead and gone to heaven!")))
	  'OK))

     'GO
     (lambda (direction)  ; Shadows person's GO
	(let ((success? (ask person-part 'GO direction)))
	  (if success? (ask clock 'TICK))
	  success?))
     
     'DIE
     (lambda (perp)
	(ask self 'SAY (list "I am slain!"))
	(ask person-part 'DIE perp))
     'FEEL-THE-FORCE
     (lambda ()
	(for-each 
	 (lambda (room) 
	   (for-each
	    (lambda (person)
	      (display (ask person 'NAME))
	      (display " is at ")
	      (display (ask room 'NAME))
	      (newline)
	      )
	    (find-all room 'person)))
	 all-rooms) 
	)
     )
    person-part)))
;;Value: "avatar --> #[compound-procedure 25 avatar]"

(setup 'Plato)
;;Value: ready

(ask me 'FEEL-THE-FORCE)
;ben-bitdiddle is at barker-library
;mr-bigglesworth is at lobby-7
;lambda-man is at eecs-ug-office
;dr-evil is at 6001-lab
;alyssa-hacker is at great-court
;plato is at student-center
;registrar is at student-center
;course-6-frosh is at student-center
;grendel is at legal-seafood
;;Value: #[unspecified-return-value]

;;;Computer Exercise 4

(define (create-ring-of-obfuscation name location)
 (create-instance ring-of-obfuscation name location))
;;Value: "create-ring-of-obfuscation --> #[compound-procedure 31 create-ring-of-obfuscation]"

(define (ring-of-obfuscation self name location)
 (let ((mobile-part (mobile-thing self name location)))
   (make-handler
    'ring-of-obfuscation
    (make-methods)
    mobile-part)))
;;Value: ring-of-obfuscation

(define (person self name birthplace)
 (let ((mobile-thing-part (mobile-thing self name birthplace))
       (container-part    (container self))
       (health            3)
       (strength          1))
   (make-handler
    'person
    (make-methods
     'STRENGTH (lambda () strength)
     'HEALTH (lambda () health)
     'SAY
     (lambda (list-of-stuff)
	(ask screen 'TELL-ROOM (ask self 'location)
	     (append (list "At" (ask (ask self 'LOCATION) 'NAME)
			   (ask self 'NAME) "says --")
		     list-of-stuff))
	'SAID-AND-HEARD)
     'HAVE-FIT
     (lambda ()
	(ask self 'SAY '("Yaaaah! I am upset!"))
	'I-feel-better-now)
       
     'PEOPLE-AROUND        ; other people in room...
     (lambda ()
	(filter
	 (lambda (x)
	   (not
	    (or (eq? x self)
		(ask x 'HAS-A 'ring-of-obfuscation)
		)
	    )
	   )
	 (find-all (ask self 'LOCATION) 'PERSON))
	)
       
     'STUFF-AROUND         ; stuff (non people) in room...
     (lambda ()
	(let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
	       (stuff (filter (lambda (x) (not (ask x 'IS-A 'PERSON))) in-room)))
	  stuff))
       
     'PEEK-AROUND          ; other people's stuff...
     (lambda ()
	(let ((people (ask self 'PEOPLE-AROUND)))
	  (fold-right append '() (map (lambda (p) (ask p 'THINGS)) people))))
    
     'TAKE
     (lambda (thing)
	(cond ((ask self 'HAVE-THING? thing)  ; already have it
	       (ask self 'SAY (list "I am already carrying"
				    (ask thing 'NAME)))
	       #f)
	      ((or (ask thing 'IS-A 'PERSON)
		   (not (ask thing 'IS-A 'MOBILE-THING)))
	       (ask self 'SAY (list "I try but cannot take"
				    (ask thing 'NAME)))
	       #F)
	      (else
	       (let ((owner (ask thing 'LOCATION)))
		 (ask self 'SAY (list "I take" (ask thing 'NAME) 
				      "from" (ask owner 'NAME)))
		 (if (ask owner 'IS-A 'PERSON)
		     (ask owner 'LOSE thing self)
		     (ask thing 'CHANGE-LOCATION self))
		 thing))))
       
     'LOSE
     (lambda (thing lose-to)
	(ask self 'SAY (list "I lose" (ask thing 'NAME)))
	(ask self 'HAVE-FIT)
	(ask thing 'CHANGE-LOCATION lose-to))
       
     'DROP
     (lambda (thing)
	(ask self 'SAY (list "I drop" (ask thing 'NAME)
			     "at" (ask (ask self 'LOCATION) 'NAME)))
	(ask thing 'CHANGE-LOCATION (ask self 'LOCATION)))
     
     'GO-EXIT
     (lambda (exit)
	(ask exit 'USE self))
       
     'GO
     (lambda (direction) ; symbol -> boolean
	(let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	  (if (and exit (ask exit 'IS-A 'EXIT))
	      (ask self 'GO-EXIT exit)
	      (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			  (list "No exit in" direction "direction"))
		     #F))))
     'SUFFER
     (lambda (hits perp)
	(ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	(set! health (- health hits))
	(if (<= health 0) (ask self 'DIE perp))
	health)
       
     'DIE          ; depends on global variable "death-exit"
     (lambda (perp)
	(for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
		  (ask self 'THINGS))
	(ask screen 'TELL-WORLD
	     '("An earth-shattering, soul-piercing scream is heard..."))
	(ask self 'DESTROY))
     
     'ENTER-ROOM
     (lambda ()
	(let ((others (ask self 'PEOPLE-AROUND)))
	  (if (not (null? others))
	      (ask self 'SAY (cons "Hi" (names-of others)))))
	#T)

    'HAS-A
    (lambda (thing)
      (define (has-a things)
	 (if (null? things)
	     #f
	     (if (ask (car things) 'is-a thing) 
		 (car things)
		 (has-a (cdr things))
		 )
	     )
	 )
      (has-a (ask container-part 'THINGS))
      )

    'HAS-A-THING-NAMED
    (lambda (thing-named)
      (define (has-a-thing-named things)
	 (if (null? things)
	     #f
	     (if (equal? 
		  thing-named 
		  (ask (car things) 'NAME))
		 (car things)
		 (has-a-thing-named (cdr things))
		 )
	     )
	 )
      (has-a-thing-named (ask container-part 'THINGS))
      ))
    mobile-thing-part container-part)))
;;Value: "person --> #[compound-procedure 27 person]"

(define (avatar self name birthplace)
 (let ((person-part (person self name birthplace)))
   (make-handler
    'avatar
    (make-methods
     'LOOK-AROUND          ; report on world around you
     (lambda ()
	(let* ((place (ask self 'LOCATION))
	       (exits (ask place 'EXITS))
	       (other-people (ask self 'PEOPLE-AROUND))
	       (my-stuff (ask self 'THINGS))
	       (stuff (ask self 'STUFF-AROUND)))
	  (ask screen 'TELL-WORLD (list "You are in" (ask place 'NAME)))
	  (ask screen 'TELL-WORLD
	       (if (null? my-stuff)
		   '("You are not holding anything.")
		   (append '("You are holding:") (names-of my-stuff))))
	  (ask screen 'TELL-WORLD
	       (if (null? stuff)
		   '("There is no stuff in the room.")
		   (append '("You see stuff in the room:") (names-of stuff))))
	  (ask screen 'TELL-WORLD
	       (if (null? other-people)
		   '("There are no other people around you.")
		   (append '("You see other people:") (names-of other-people))))
	  (ask screen 'TELL-WORLD
	       (if (not (null? exits))
		   (append '("The exits are in directions:") (names-of exits))
		   ;; heaven is only place with no exits
		   '("There are no exits... you are dead and gone to heaven!")))
	  'OK))

     'GO
     (lambda (direction)  ; Shadows person's GO
	(let ((success? (ask person-part 'GO direction)))
	  (if success? (ask clock 'TICK))
	  success?))
     
     'DIE
     (lambda (perp)
	(ask self 'SAY (list "I am slain!"))
	(ask person-part 'DIE perp))
     'FEEL-THE-FORCE
     (lambda ()
	(for-each 
	 (lambda (room) 
	   (for-each
	    (lambda (person)
	      (display (ask person 'NAME))
	      (display " is at ")
	      (display (ask room 'NAME))
	      (newline)
	      )
	    (filter 
	     (lambda (x)
	       (not (ask x 'has-a 'ring-of-obfuscation))
	       )
	     (find-all room 'person))))
	 all-rooms) 
	)
     )
    person-part)))
;;Value: "avatar --> #[compound-procedure 78 avatar]"

(define (populate-ring-of-obfuscations rooms)
 (let* ((ring-of-obfuscations 
	  (map (lambda (name)
		 (create-ring-of-obfuscation 
		  name
		  (pick-random rooms)))
	       '(the-king-of-ring golden-ring silver-ring brass-ring))))
	 ring-of-obfuscations))
;;Value: "populate-ring-of-obfuscations --> #[compound-procedure 28 populate-ring-of-obfuscations]"

(define (setup name)
 (ask clock 'RESET)
 (ask clock 'ADD-CALLBACK
      (create-clock-callback 'tick-printer clock 'PRINT-TICK))
 (let ((rooms (create-world)))
   (set! chamber-of-stata (instantiate-spells))

   (populate-spells rooms)

   (populate-players rooms)

   (populate-ring-of-obfuscations rooms)

   ;uncomment after writing chosen one
;;    (create-chosen-one 'hairy-cdr (pick-random rooms)
;;		       (random-number 3) (random-number 3))
   
   (set! me (create-avatar name (pick-random rooms)))
   (ask screen 'SET-ME me)
   (set! all-rooms rooms)
   'ready))
;;Value: "setup --> #[compound-procedure 79 setup]"

(setup 'Plato)
;;Value: ready

(ask screen 'DEITY-MODE #f)
;;Value: #f

(define (find-rings)
 (for-each 
  (lambda (room) 
    (for-each
     (lambda (ring)
	(display (ask ring 'NAME))
	(display " is at ")
	(display (ask room 'NAME))
	(newline)
	)
     (find-all room 'ring-of-obfuscation)))
  all-rooms))
;;Value: "find-rings --> #[compound-procedure 80 find-rings]"

(find-rings)

;silver-ring is at 6001-lab
;brass-ring is at building-13
;golden-ring is at great-court
;the-king-of-ring is at student-center
;;Value: #[unspecified-return-value]

(ask me 'look-around)

;You are in grendels-den 
;You are not holding anything. 
;You see stuff in the room: boil-spell 
;You see other people: registrar 
;The exits are in directions: up 
;;Value: ok


(ask me 'go 'up)

;plato moves from grendels-den to lobby-10 
;--- the-clock Tick 0 --- 
;At lobby-10 ben-bitdiddle says -- Hi plato 
;At lobby-10 ben-bitdiddle says -- I take boil-spell from lobby-10 
;At lobby-10 mr-bigglesworth says -- Hi ben-bitdiddle plato 
;At lobby-10 mr-bigglesworth says -- I'll let you off this once... 
;At lobby-10 registrar says -- Hi mr-bigglesworth ben-bitdiddle plato 
;At lobby-10 registrar takes a bite out of plato 
;At lobby-10 plato says -- Ouch! 3 hits is more than I want! 
;At lobby-10 plato says -- I am slain! 
;An earth-shattering, soul-piercing scream is heard... 
;;Value: #t

(ask me 'go 'north)

;plato moves from lobby-10 to building-13 
;--- the-clock Tick 1 --- 
;At building-13 mr-bigglesworth says -- Hi plato 
;mr-bigglesworth moves from building-13 to lobby-10 
;;Value: #t

(ask me 'look-around)

;You are in building-13 
;You are not holding anything. 
;You see stuff in the room: brass-ring boil-spell 
;There are no other people around you. 
;The exits are in directions: north south 
;;Value: ok

(ask me 'take (thing-named 'brass-ring))

;At building-13 plato says -- I take brass-ring from building-13 
;;Value: (instance #[compound-procedure 81 handler])

(ask me 'go 'south)

;plato moves from building-13 to lobby-10 
;At lobby-10 plato says -- Hi registrar 
;--- the-clock Tick 2 --- 
;registrar moves from lobby-10 to lobby-7 
;An earth-shattering, soul-piercing scream is heard... 
;;Value: #t

(ask me 'look-around)

;You are in lobby-10 
;You are holding: brass-ring 
;There is no stuff in the room. 
;There are no other people around you. 
;The exits are in directions: south north west down up 
;;Value: ok

(ask me 'go 'up)

;plato moves from lobby-10 to 10-250 
;--- the-clock Tick 3 --- 
;;Value: #t

(ask me 'look-around)

;You are in 10-250 
;You are holding: brass-ring 
;You see stuff in the room: boil-spell recitation-problem problem-set blackboard 
;There are no other people around you. 
;The exits are in directions: up down 
;;Value: ok

(ask me 'go 'up)

;plato moves from 10-250 to barker-library 
;--- the-clock Tick 4 --- 
;;Value: #t

(ask me 'look-around)

;You are in barker-library 
;You are holding: brass-ring 
;You see stuff in the room: slug-spell engineering-book 
;There are no other people around you. 
;The exits are in directions: down 
;;Value: ok

(ask me 'go 'down)

;plato moves from barker-library to 10-250 
;--- the-clock Tick 5 --- 
;;Value: #t

(ask me 'look-around)

;You are in 10-250 
;You are holding: brass-ring 
;You see stuff in the room: boil-spell recitation-problem problem-set blackboard 
;There are no other people around you. 
;The exits are in directions: up down 
;;Value: ok

(ask me 'go 'down)

;plato moves from 10-250 to lobby-10 
;At lobby-10 plato says -- Hi registrar alyssa-hacker 
;--- the-clock Tick 6 --- 
;alyssa-hacker moves from lobby-10 to great-court 
;At lobby-10 dr-evil says -- Hi registrar 
;dr-evil moves from lobby-10 to great-court 
;registrar moves from lobby-10 to 10-250 
;;Value: #t

(ask me 'look-around)

;You are in lobby-10 
;You are holding: brass-ring 
;There is no stuff in the room. 
;There are no other people around you. 
;The exits are in directions: south north west down up 
;;Value: ok

(ask me 'go 'south)

;plato moves from lobby-10 to great-court 
;At great-court plato says -- Hi dr-evil alyssa-hacker 
;--- the-clock Tick 7 --- 
;alyssa-hacker moves from great-court to graduation-stage 
;dr-evil moves from great-court to legal-seafood 
;mr-bigglesworth moves from great-court to lobby-10 
;;Value: #t

(ask me 'look-around)

;You are in great-court 
;You are holding: brass-ring 
;You see stuff in the room: golden-ring flag-pole lovely-trees 
;There are no other people around you. 
;The exits are in directions: up west north 
;;Value: ok

(ask me 'go 'up)

;plato moves from great-court to graduation-stage 
;At graduation-stage plato says -- Hi alyssa-hacker 
;--- the-clock Tick 8 --- 
;alyssa-hacker moves from graduation-stage to great-court 
;;Value: #t

(ask me 'look-around)

;You are in graduation-stage 
;You are holding: brass-ring 
;You see stuff in the room: slug-spell diploma 
;You see other people: mr-bigglesworth 
;The exits are in directions: down 
;;Value: ok

(ask (thing-named 'mr-bigglesworth) 'people-around)
;;Value: #f

(ask me 'drop (thing-named 'brass-ring))

;At graduation-stage plato says -- I drop brass-ring at graduation-stage 
;;Value: (instance #[compound-procedure 82 handler])

(ask (thing-named 'mr-bigglesworth) 'people-around)
;;Value: ((instance #[compound-procedure 82 handler]))

(ask (thing-named 'mr-bigglesworth) 'take (thing-named 'brass-ring))

;At graduation-stage mr-bigglesworth says -- I take brass-ring from graduation-stage 
;;Value: (instance #[compound-procedure 81 handler])

(ask me 'people-around)
;;Value: #f

(ask me 'feel-the-force)
;ben-bitdiddle is at lobby-7
;registrar is at edgerton-hall
;lambda-man is at edgerton-hall
;dr-evil is at 34-301
;alyssa-hacker is at great-court
;course-6-frosh is at bexley
;plato is at graduation-stage
;;Value: #[unspecified-return-value]

;;;Computer Exercise 5

(define (create-wand name location)
 (create-instance wand name location))
;;Value: "create-wand --> #[compound-procedure 83 create-wand]"

(define (wand self name location)
 (let ((mobile-part (mobile-thing self name location)))
   (make-handler
    'wand
    (make-methods
     'ZAP
     (lambda (target)
	(let* ((caster (ask self 'location))
	      (spell (pick-random (find-all caster 'spell))))
	  (if (null? spell)
	      (ask caster 'emit '(However, Nothing is happening))
	      (begin
		(display (ask spell 'incant))
		(ask spell 'use caster target))
	      )
	  )
	)
     'WAVE
     (lambda ()
	(let* ((caster (ask self 'location))
	       (target (pick-random (ask caster 'people-around))))
	  (ask self 'zap target)
	  )
	)
     )
    mobile-part)))
;;Value: "wand --> #[compound-procedure 111 wand]"

(setup 'Plato)
;;Value: ready

(ask me 'look-around)

;You are in legal-seafood 
;You are not holding anything. 
;You see stuff in the room: the-king-of-ring boil-spell 
;There are no other people around you. 
;The exits are in directions: east south 
;;Value: ok

(create-wand 'gold-wand (ask me 'location))
;;Value: (instance #[compound-procedure 103 handler])

(ask me 'take (thing-named 'boil-spell))

;At legal-seafood plato says -- I take boil-spell from legal-seafood 
;;Value: (instance #[compound-procedure 104 handler])

(ask me 'take (thing-named 'gold-wand))

;At legal-seafood plato says -- I take gold-wand from legal-seafood 
;;Value: (instance #[compound-procedure 103 handler])

(ask me 'take (thing-named 'the-king-of-ring))

;At legal-seafood plato says -- I take the-king-of-ring from legal-seafood 
;;Value: (instance #[compound-procedure 105 handler])


(ask clock 'tick)

;--- the-clock Tick 0 --- 
;An earth-shattering, soul-piercing scream is heard... 
;;Value: 0

(ask clock 'tick)

;--- the-clock Tick 1 --- 
;;Value: 1

(ask clock 'tick)

;--- the-clock Tick 2 --- 
;;Value: 2

(ask clock 'tick)

;--- the-clock Tick 3 --- 
;;Value: 3

(ask me 'go 'east)

;plato moves from legal-seafood to great-court 
;--- the-clock Tick 4 --- 
;;Value: #t

(ask clock 'tick)

;--- the-clock Tick 5 --- 
;At great-court grendel 's belly rumbles 
;;Value: 5

(ask me 'look-around)

;You are in great-court 
;You are holding: the-king-of-ring gold-wand boil-spell 
;You see stuff in the room: slug-spell flag-pole lovely-trees 
;You see other people: grendel 
;The exits are in directions: up west north 
;;Value: ok

(create-wand 'silver-wand (ask me 'location))
;;Value: (instance #[compound-procedure 112 handler])

(ask me 'take (thing-named 'silver-wand))

;At great-court plato says -- I take silver-wand from great-court 
;;Value: (instance #[compound-procedure 112 handler])

(ask (thing-named 'silver-wand) 'zap (thing-named 'grendel))
;habooic katarnum
;At great-court grendel grows boils on their nose 
;;Value: message-displayed

(ask me 'take (thing-named 'slug-spell))

;At great-court plato says -- I take slug-spell from great-court 
;;Value: (instance #[compound-procedure 113 handler])

(ask (thing-named 'silver-wand) 'zap (thing-named 'grendel))
;dagnabbit ekaterin
;At great-court A slug comes out of grendel 's mouth. 
;;Value: (instance #[compound-procedure 114 handler])

(ask me 'drop (thing-named 'slug-spell))

;At great-court plato says -- I drop slug-spell at great-court 
;;Value: (instance #[compound-procedure 110 handler])

(ask me 'drop (thing-named 'boil-spell))

;At great-court plato says -- I drop boil-spell at great-court 
;;Value: (instance #[compound-procedure 110 handler])

(ask (thing-named 'silver-wand) 'wave)

;At great-court however, nothing is happening 
;;Value: message-displayed

;;;Computer Exercise 6
(define (instantiate-spells)
 (let ((chamber (create-place 'chamber-of-stata)))
   (create-spell
    'boil-spell
    chamber
    "habooic katarnum"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'EMIT
		(list (ask target 'NAME) "grows boils on their nose"))
	   (display "The spell can not work!")
	   )
      )
    )
   (create-spell
    'slug-spell
    chamber
    "dagnabbit ekaterin"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (begin
	     (ask target 'EMIT 
		  (list "A slug comes out of" (ask target 'NAME) "'s mouth."))
	     (create-mobile-thing 'slug (ask target 'LOCATION)))
	   (display "The spell can not work!")
	   )
      )
    )
   (create-spell
    'WIND-OF-DOOM
    chamber
    "DOOM!!!!!!!"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'suffer (random-number 2) caster)
	   (ask target 'destroy)
	   )
      )
    )
   (create-spell
    'my-spell
    chamber
    "my spell!"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'have-fit))
      )
    )
   chamber))
;;Value: "instantiate-spells --> #[compound-procedure 130 instantiate-spells]"

(define (wand self name location)
 (let ((mobile-part (mobile-thing self name location)))
   (make-handler
    'wand
    (make-methods
     'ZAP
     (lambda (target)
	(let* ((caster (ask self 'location))
	      (spell (pick-random (find-all caster 'spell))))
	  (if (or (null? spell) (null? target))
	      (ask caster 'emit '(However, Nothing is happening))
	      (begin
		(display (ask spell 'incant))
		(ask spell 'use caster target))
	      )
	  )
	)
     'WAVE
     (lambda ()
	(let* ((caster (ask self 'location))
	       (target (pick-random 
			(delq caster (find-all (ask caster 'location) 'thing)))))
	  (ask self 'zap target)
	  )
	)
     )
    mobile-part)))
;;Value: "wand --> #[compound-procedure 129 wand]"

(setup 'Plato)
;;Value: ready

(clone-spell (pick-random (ask chamber-of-stata 'THINGS)) (ask me 'location))
;;Value: (instance #[compound-procedure 139 handler])

;;Value: (instance #[compound-procedure 138 handler])

;;Value: (instance #[compound-procedure 137 handler])

;;Value: (instance #[compound-procedure 136 handler])

;;Value: (instance #[compound-procedure 135 handler])

;;Value: (instance #[compound-procedure 134 handler])

;;Value: (instance #[compound-procedure 133 handler])

;;Value: (instance #[compound-procedure 132 handler])

;;Value: (instance #[compound-procedure 131 handler])

(ask me 'look-around)

;You are in eecs-ug-office 
;You are not holding anything. 
;You see stuff in the room: boil-spell my-spell boil-spell boil-spell wind-of-doom slug-spell wind-of-doom boil-spell wind-of-doom boil-spell 
;There are no other people around you. 
;The exits are in directions: east 
;;Value: ok

(create-wand 'gold-wand (ask me 'location))
;;Value: (instance #[compound-procedure 140 handler])

(create-autonomous-person 
'tester
(ask me 'location)
(random-number 3)
(random-number 3))
;;Value: (instance #[compound-procedure 141 handler])

(ask me 'take (thing-named 'gold-wand))

;At eecs-ug-office plato says -- I take gold-wand from eecs-ug-office 
;;Value: (instance #[compound-procedure 140 handler])


(ask me 'take (thing-named 'slug-spell))

;At eecs-ug-office plato says -- I take slug-spell from eecs-ug-office 
;;Value: (instance #[compound-procedure 134 handler])

(ask (thing-named 'gold-wand) 'zap (thing-named 'tester))
;dagnabbit ekaterin
;At eecs-ug-office A slug comes out of tester 's mouth. 
;;Value: (instance #[compound-procedure 142 handler])

(ask me 'look-around)

;You are in eecs-ug-office 
;You are holding: slug-spell gold-wand 
;You see stuff in the room: slug boil-spell my-spell boil-spell boil-spell wind-of-doom wind-of-doom boil-spell wind-of-doom boil-spell 
;You see other people: tester 
;The exits are in directions: east 
;;Value: ok

(ask (thing-named 'gold-wand) 'zap (thing-named 'slug))
;dagnabbit ekaterinThe spell can not work!
;;Value: #[unspecified-return-value]

(ask me 'take (thing-named 'wind-of-doom))

;There is more than one thing named wind-of-doom here. Picking one of them. 
;At eecs-ug-office plato says -- I take wind-of-doom from eecs-ug-office 
;;Value: (instance #[compound-procedure 131 handler])

(ask (thing-named 'gold-wand) 'wave)
;DOOM!!!!!!!
;;Value: done

(ask me 'look-around)

;You are in eecs-ug-office 
;You are holding: wind-of-doom slug-spell gold-wand 
;You see stuff in the room: boil-spell my-spell boil-spell boil-spell wind-of-doom wind-of-doom boil-spell boil-spell 
;You see other people: tester 
;The exits are in directions: east 
;;Value: ok

(ask (thing-named 'gold-wand) 'zap (thing-named 'tester))
;DOOM!!!!!!!
;At eecs-ug-office tester says -- Ouch! 2 hits is more than I want! 
;;Value: 1

(ask me 'take (thing-named 'my-spell))

;At eecs-ug-office plato says -- I take my-spell from eecs-ug-office 
;;Value: (instance #[compound-procedure 138 handler])

(ask (thing-named 'gold-wand) 'zap (thing-named 'tester))
;my spell!
;At eecs-ug-office tester says -- Yaaaah! I am upset! 
;;Value: i-feel-better-now

;dagnabbit ekaterin
;At eecs-ug-office A slug comes out of tester 's mouth. 
;;Value: (instance #[compound-procedure 143 handler])

;;; Computer Exercise 7

(define (create-wit-student name birthplace activity miserly)
 (create-instance wit-student name birthplace activity miserly))
;;Value: "create-wit-student --> #[compound-procedure 7 create-wit-student]"

(define (wit-student self name birthplace activity miserly)
 (let ((person-part (person self name birthplace)))
   (make-handler
    'wit-student
    (make-methods
     'INSTALL
     (lambda ()
	(ask person-part 'INSTALL)
	(ask clock 'ADD-CALLBACK
	     (create-clock-callback 'zap self 
				    'ZAP))
	
	(ask clock 'ADD-CALLBACK
	     (create-clock-callback 'move-and-take-stuff self 
				    'MOVE-AND-TAKE-STUFF))
	(create-wand (symbol-append name '-wand) self)
	(clone-spell (pick-random (ask chamber-of-stata 'THINGS)) self)
	)
     'MOVE-AND-TAKE-STUFF
     (lambda ()
	;; first move
	(let loop ((moves (random-number activity)))
	  (if (= moves 0)
	      'done-moving
	      (begin
		(ask self 'MOVE-SOMEWHERE)
		(loop (- moves 1)))))
	;; then take stuff
	(if (= (random miserly) 0)
	    (ask self 'TAKE-SOMETHING))
	'done-for-this-tick)
     'ZAP
     (lambda ()
	(let ((wands (find-all self 'wand))
	      (targets (find-all (ask self 'location) 'person)))
	  (ask self 'emit '(wit-student here))
	  (if (not (null? wands))
	      (if (not (null? targets))
		  (ask (car wands) 'zap (car targets))
		  (ask (car wands) 'wand)))
	  'done-for-this-tick
	  )
	)
     'DIE
     (lambda (perp)
	(ask clock 'REMOVE-CALLBACK self 'ZAP)
	(ask clock 'REMOVE-CALLBACK self 'move-and-take-stuff)
	(ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	(ask person-part 'DIE perp))
     'MOVE-SOMEWHERE
     (lambda ()
	(let ((exit (random-exit (ask self 'LOCATION))))
	  (if (not (null? exit)) (ask self 'GO-EXIT exit))))
     'TAKE-SOMETHING
     (lambda ()
	(let* ((stuff-in-room (ask self 'STUFF-AROUND))
	       (other-peoples-stuff (ask self 'PEEK-AROUND))
	       (pick-from (append stuff-in-room other-peoples-stuff)))
	  (if (not (null? pick-from))
	      (ask self 'TAKE (pick-random pick-from))
	      #F))))
    person-part)))
;;Value: "wit-student --> #[compound-procedure 10 wit-student]"

(define create-autonomous-person create-wit-student)
;;Value: "create-autonomous-person --> #[compound-procedure 7 create-wit-student]"

(setup 'Plato)
;;Value: ready

(ask screen 'DEITY-MODE #t)
;;Value: #t

(ask clock 'TICK)

;--- the-clock Tick 0 --- 
;At legal-seafood wit-student here dagnabbit ekaterin
;At legal-seafood A slug comes out of ben-bitdiddle 's mouth. 
;ben-bitdiddle moves from legal-seafood to great-court 
;ben-bitdiddle moves from great-court to legal-seafood 
;At edgerton-hall wit-student here habooic katarnum
;At edgerton-hall registrar grows boils on their nose 
;alyssa-hacker moves from edgerton-hall to building-13 
;At building-13 alyssa-hacker says -- I take slug-spell from building-13 
;At graduation-stage wit-student here habooic katarnum
;At graduation-stage course-6-frosh grows boils on their nose 
;course-6-frosh moves from graduation-stage to great-court 
;course-6-frosh moves from great-court to lobby-10 
;At 10-250 wit-student here habooic katarnum
;At 10-250 plato grows boils on their nose 
;lambda-man moves from 10-250 to lobby-10 
;At lobby-10 lambda-man says -- Hi course-6-frosh 
;lambda-man moves from lobby-10 to grendels-den 
;dr-evil moves from student-center to bexley 
;mr-bigglesworth moves from eecs-ug-office to eecs-hq 
;At eecs-hq mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from student-center to lobby-7 
;registrar moves from edgerton-hall to legal-seafood 
;At legal-seafood registrar says -- Hi ben-bitdiddle 
;;Value: 0

(ask clock 'TICK)

;--- the-clock Tick 1 --- 
;At legal-seafood wit-student here dagnabbit ekaterin
;At legal-seafood A slug comes out of registrar 's mouth. 
;ben-bitdiddle moves from legal-seafood to edgerton-hall 
;ben-bitdiddle moves from edgerton-hall to building-13 
;At building-13 ben-bitdiddle says -- Hi alyssa-hacker 
;At building-13 ben-bitdiddle says -- I take slug-spell from alyssa-hacker 
;At building-13 alyssa-hacker says -- I lose slug-spell 
;At building-13 alyssa-hacker says -- Yaaaah! I am upset! 
;At building-13 wit-student here habooic katarnum
;At building-13 ben-bitdiddle grows boils on their nose 
;alyssa-hacker moves from building-13 to edgerton-hall 
;alyssa-hacker moves from edgerton-hall to 34-301 
;alyssa-hacker moves from 34-301 to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- I take boil-spell from edgerton-hall 
;At lobby-10 wit-student here habooic katarnum
;At lobby-10 course-6-frosh grows boils on their nose 
;course-6-frosh moves from lobby-10 to great-court 
;At grendels-den wit-student here habooic katarnum
;At grendels-den lambda-man grows boils on their nose 
;lambda-man moves from grendels-den to lobby-10 
;lambda-man moves from lobby-10 to grendels-den 
;At grendels-den lambda-man says -- I take boil-spell from grendels-den 
;dr-evil moves from bexley to baker 
;mr-bigglesworth moves from eecs-hq to 34-301 
;grendel moves from lobby-7 to student-center 
;registrar moves from legal-seafood to great-court 
;At great-court registrar says -- Hi course-6-frosh 
;At great-court registrar takes a bite out of course-6-frosh 
;At great-court course-6-frosh says -- Ouch! 3 hits is more than I want! 
;At great-court course-6-frosh says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At great-court course-6-frosh says -- I lose boil-spell 
;At great-court course-6-frosh says -- Yaaaah! I am upset! 
;At great-court course-6-frosh says -- I lose course-6-frosh-wand 
;At great-court course-6-frosh says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;;Value: 1

(ask clock 'TICK)

;--- the-clock Tick 2 --- 
;At building-13 wit-student here dagnabbit ekaterin
;At building-13 A slug comes out of ben-bitdiddle 's mouth. 
;ben-bitdiddle moves from building-13 to edgerton-hall 
;At edgerton-hall ben-bitdiddle says -- Hi alyssa-hacker 
;At edgerton-hall wit-student here habooic katarnum
;At edgerton-hall ben-bitdiddle grows boils on their nose 
;alyssa-hacker moves from edgerton-hall to building-13 
;alyssa-hacker moves from building-13 to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- Hi ben-bitdiddle 
;At edgerton-hall alyssa-hacker says -- I take ben-bitdiddle-wand from ben-bitdiddle 
;At edgerton-hall ben-bitdiddle says -- I lose ben-bitdiddle-wand 
;At edgerton-hall ben-bitdiddle says -- Yaaaah! I am upset! 
;At grendels-den wit-student here habooic katarnum
;At grendels-den lambda-man grows boils on their nose 
;lambda-man moves from grendels-den to lobby-10 
;dr-evil moves from baker to bexley 
;At bexley dr-evil says -- Grrr... When I catch those students... 
;mr-bigglesworth moves from 34-301 to stata-center 
;At stata-center mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from student-center to lobby-7 
;grendel moves from lobby-7 to lobby-10 
;At lobby-10 grendel says -- Hi lambda-man 
;registrar moves from great-court to legal-seafood 
;registrar moves from legal-seafood to great-court 
;At great-court registrar 's belly rumbles 
;;Value: 2


;;; Computer Exercise 8
(define (create-wit-professor name birthplace activity miserly)
 (create-instance wit-professor name birthplace activity miserly))
;;Value: "create-wit-professor --> #[compound-procedure 11 create-wit-professor]"

(define (wit-professor self name birthplace activity miserly)
 (let ((wit-part (wit-student self name birthplace activity miserly)))
   (make-handler
    'wit-professor
    (make-methods
     'INSTALL
     (lambda ()
	(ask wit-part 'INSTALL)
	(ask clock 'ADD-CALLBACK
	     (create-clock-callback 'teach self 
				    'TEACH))
	)
     'TEACH
     (lambda ()
	(let ((wit-students (find-all self 'wit-student)))
	  (ask self 'emit '(teach wit-student here!))
	  (if (not (null? wit-students))
	      (clone-spell (pick-random (ask chamber-of-stata 'THINGS)) (car wit-students))
	      )
	  'done-for-this-tick
	  )
	)
     'DIE
     (lambda (perp)
	(ask clock 'REMOVE-CALLBACK self 'TEACH)
	(ask wit-part 'DIE)
	))
    wit-part)))
;;Value: "wit-professor --> #[compound-procedure 14 wit-professor]"

(define (populate-players rooms)
 (let* ((students (map (lambda (name)
			  (create-autonomous-person name
						    (pick-random rooms)
						    (random-number 3)
						    (random-number 3)))
			'(ben-bitdiddle alyssa-hacker
			  course-6-frosh lambda-man)))
;;uncomment after writing professors
	 (profs (map (lambda (name)
		       (create-wit-professor name
					     (pick-random rooms)
					     (random-number 3)
					     (random-number 3)))
		     '(susan-hockfield eric-grimson)))
	 (monitors (map (lambda (name)
			  (create-hall-monitor name
					       (pick-random rooms)
					       (random-number 3)
					       (random-number 3)))
			'(dr-evil mr-bigglesworth)))
	 (trolls (map (lambda (name)
			(create-troll name
				      (pick-random rooms)
				      (random-number 3)
				      (random-number 3)))
		      '(grendel registrar))))

   (append students
	    profs        ;uncomment after writing wit-professor
	    monitors trolls)))
;;Value: "populate-players --> #[compound-procedure 13 populate-players]"

(setup 'Plato)
;;Value: ready

(ask clock 'TICK)

;--- the-clock Tick 0 --- 
;At building-13 wit-student here my spell!
;At building-13 susan-hockfield says -- Yaaaah! I am upset! 
;ben-bitdiddle moves from building-13 to lobby-10 
;At building-13 wit-student here DOOM!!!!!!!
;At building-13 susan-hockfield says -- Ouch! 2 hits is more than I want! 
;alyssa-hacker moves from building-13 to lobby-10 
;At lobby-10 alyssa-hacker says -- Hi ben-bitdiddle 
;At building-13 wit-student here my spell!
;At building-13 susan-hockfield says -- Yaaaah! I am upset! 
;course-6-frosh moves from building-13 to edgerton-hall 
;course-6-frosh moves from edgerton-hall to building-13 
;At building-13 course-6-frosh says -- Hi susan-hockfield 
;course-6-frosh moves from building-13 to lobby-10 
;At lobby-10 course-6-frosh says -- Hi alyssa-hacker ben-bitdiddle 
;At lobby-10 course-6-frosh says -- I take alyssa-hacker-wand from alyssa-hacker 
;At lobby-10 alyssa-hacker says -- I lose alyssa-hacker-wand 
;At lobby-10 alyssa-hacker says -- Yaaaah! I am upset! 
;At baker wit-student here habooic katarnum
;At baker registrar grows boils on their nose 
;lambda-man moves from baker to bexley 
;At bexley lambda-man says -- Hi plato 
;At bexley lambda-man says -- I take slug-spell from bexley 
;At building-13 wit-student here dagnabbit ekaterin
;At building-13 A slug comes out of susan-hockfield 's mouth. 
;susan-hockfield moves from building-13 to edgerton-hall 
;At edgerton-hall susan-hockfield says -- I take boil-spell from edgerton-hall 
;At edgerton-hall teach wit-student here! 
;At 10-250 wit-student here DOOM!!!!!!!
;At 10-250 dr-evil says -- Ouch! 2 hits is more than I want! 
;eric-grimson moves from 10-250 to lobby-10 
;At lobby-10 eric-grimson says -- Hi course-6-frosh alyssa-hacker ben-bitdiddle 
;At lobby-10 eric-grimson says -- I take slug-spell from lobby-10 
;At lobby-10 teach wit-student here! 
;dr-evil moves from 10-250 to lobby-10 
;At lobby-10 dr-evil says -- Hi eric-grimson course-6-frosh alyssa-hacker ben-bitdiddle 
;dr-evil moves from lobby-10 to lobby-7 
;mr-bigglesworth moves from eecs-hq to eecs-ug-office 
;mr-bigglesworth moves from eecs-ug-office to eecs-hq 
;At eecs-hq mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from stata-center to 34-301 
;At 34-301 grendel 's belly rumbles 
;registrar moves from baker to bexley 
;At bexley registrar says -- Hi lambda-man plato 
;At bexley registrar takes a bite out of lambda-man 
;At bexley lambda-man says -- Ouch! 3 hits is more than I want! 
;At bexley lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At bexley lambda-man says -- I lose slug-spell 
;At bexley lambda-man says -- Yaaaah! I am upset! 
;At bexley lambda-man says -- I lose boil-spell 
;At bexley lambda-man says -- Yaaaah! I am upset! 
;At bexley lambda-man says -- I lose lambda-man-wand 
;At bexley lambda-man says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;;Value: 0


(ask clock 'TICK)

;--- the-clock Tick 1 --- 
;At lobby-10 wit-student here my spell!
;At lobby-10 eric-grimson says -- Yaaaah! I am upset! 
;ben-bitdiddle moves from lobby-10 to lobby-7 
;At lobby-7 ben-bitdiddle says -- Hi dr-evil 
;At lobby-7 ben-bitdiddle says -- I take my-spell from lobby-7 
;At lobby-10 wit-student here 
;alyssa-hacker moves from lobby-10 to building-13 
;alyssa-hacker moves from building-13 to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- Hi susan-hockfield 
;At lobby-10 wit-student here my spell!
;At lobby-10 eric-grimson says -- Yaaaah! I am upset! 
;course-6-frosh moves from lobby-10 to great-court 
;course-6-frosh moves from great-court to graduation-stage 
;course-6-frosh moves from graduation-stage to great-court 
;At great-court course-6-frosh says -- I try but cannot take flag-pole 
;At edgerton-hall wit-student here dagnabbit ekaterin
;At edgerton-hall A slug comes out of alyssa-hacker 's mouth. 
;susan-hockfield moves from edgerton-hall to building-13 
;At building-13 teach wit-student here! 
;At lobby-10 wit-student here DOOM!!!!!!!
;At lobby-10 eric-grimson says -- Ouch! 2 hits is more than I want! 
;eric-grimson moves from lobby-10 to great-court 
;At great-court eric-grimson says -- Hi course-6-frosh 
;At great-court eric-grimson says -- I take my-spell from course-6-frosh 
;At great-court course-6-frosh says -- I lose my-spell 
;At great-court course-6-frosh says -- Yaaaah! I am upset! 
;At great-court teach wit-student here! 
;dr-evil moves from lobby-7 to lobby-10 
;dr-evil moves from lobby-10 to lobby-7 
;At lobby-7 dr-evil says -- Hi ben-bitdiddle 
;At lobby-7 dr-evil says -- I'll let you off this once... 
;mr-bigglesworth moves from eecs-hq to 34-301 
;At 34-301 mr-bigglesworth says -- Hi grendel 
;At 34-301 mr-bigglesworth says -- What are you doing still up? Everyone back to their rooms! 
;At 34-301 grendel goes home to stata-center 
;grendel moves from stata-center to stata-center 
;grendel moves from stata-center to stata-center 
;registrar moves from bexley to baker 
;At baker registrar 's belly rumbles 
;;Value: 1

;;; Computer Exercise 9
(define (instantiate-spells)
 (let ((chamber (create-place 'chamber-of-stata)))
   (create-spell
    'boil-spell
    chamber
    "habooic katarnum"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'EMIT
		(list (ask target 'NAME) "grows boils on their nose"))
	   (display "The spell can not work!")
	   )
      )
    )
   (create-spell
    'slug-spell
    chamber
    "dagnabbit ekaterin"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (begin
	     (ask target 'EMIT 
		  (list "A slug comes out of" (ask target 'NAME) "'s mouth."))
	     (create-mobile-thing 'slug (ask target 'LOCATION)))
	   (display "The spell can not work!")
	   )
      )
    )
   (create-spell
    'WIND-OF-DOOM
    chamber
    "DOOM!!!!!!!"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'suffer (random-number 2) "perp")
	   (ask target 'destroy)
	   )
      )
    )
   (create-spell
    'my-spell
    chamber
    "my spell!"
    (lambda (caster target)
      (if (ask target 'is-a 'person)
	   (ask target 'have-fit))
      )
    )
   (create-spell
    'counter-spell
    chamber
    "counter spell!"
    (lambda (caster target)
      'no-effect
      )
    )
   chamber))
;;Value: "instantiate-spells --> #[compound-procedure 15 instantiate-spells]"

(define (spell self name location incant action)
 (let ((mobile-part (mobile-thing self name location)))
   (make-handler
    'spell
    (make-methods
     'INCANT
     (lambda () incant)
     'ACTION
     (lambda () action)
     'USE
     (lambda (caster target)
	(if (ask target 'HAS-A-THING-NAMED 'counter-spell)
	    (display "It has counter-spell!!!")
	    (action caster target)
	    )
	)
     )
    mobile-part)))
;;Value: "spell --> #[compound-procedure 62 spell]"

(setup 'Plato)
;;Value: ready

(map (lambda (x) (ask x 'name)) (ask chamber-of-stata 'THINGS))
;;Value: (counter-spell my-spell wind-of-doom slug-spell boil-spell)

(for-each 
(lambda (room) 
  (for-each
   (lambda (person)
     (clone-spell (car (ask chamber-of-stata 'THINGS)) person)
     )
   (find-all room 'wit-student)))
all-rooms)
;;Value: #[unspecified-return-value]

(ask clock 'tick)

;--- the-clock Tick 0 --- 
;At lobby-7 wit-student here DOOM!!!!!!!It has counter-spell!!!
;ben-bitdiddle moves from lobby-7 to lobby-10 
;ben-bitdiddle moves from lobby-10 to lobby-7 
;At lobby-7 ben-bitdiddle says -- Hi eric-grimson 
;At lobby-7 ben-bitdiddle says -- I take eric-grimson-wand from eric-grimson 
;At lobby-7 eric-grimson says -- I lose eric-grimson-wand 
;At lobby-7 eric-grimson says -- Yaaaah! I am upset! 
;At edgerton-hall wit-student here counter spell!It has counter-spell!!!
;alyssa-hacker moves from edgerton-hall to 34-301 
;At 6001-lab wit-student here dagnabbit ekaterin
;At 6001-lab A slug comes out of plato 's mouth. 
;course-6-frosh moves from 6001-lab to eecs-hq 
;course-6-frosh moves from eecs-hq to eecs-ug-office 
;At eecs-ug-office course-6-frosh says -- Hi grendel 
;At eecs-ug-office course-6-frosh says -- I take wind-of-doom from eecs-ug-office 
;At bexley wit-student here habooic katarnum
;At bexley dr-evil grows boils on their nose 
;lambda-man moves from bexley to student-center 
;lambda-man moves from student-center to lobby-7 
;At lobby-7 lambda-man says -- Hi ben-bitdiddle eric-grimson 
;At lobby-7 lambda-man says -- I take ben-bitdiddle-wand from ben-bitdiddle 
;At lobby-7 ben-bitdiddle says -- I lose ben-bitdiddle-wand 
;At lobby-7 ben-bitdiddle says -- Yaaaah! I am upset! 
;At building-13 wit-student here counter spell!It has counter-spell!!!
;susan-hockfield moves from building-13 to edgerton-hall 
;susan-hockfield moves from edgerton-hall to building-13 
;At building-13 teach wit-student here! 
;At lobby-7 wit-student here 
;eric-grimson moves from lobby-7 to student-center 
;At student-center eric-grimson says -- I take wind-of-doom from student-center 
;At student-center teach wit-student here! 
;dr-evil moves from bexley to baker 
;mr-bigglesworth moves from graduation-stage to great-court 
;At great-court mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from eecs-ug-office to eecs-hq 
;At eecs-hq grendel 's belly rumbles 
;registrar moves from 6001-lab to eecs-hq 
;At eecs-hq registrar says -- Hi grendel 
;;Value: 0


;;; Computer Exercise 10
(define (create-chose-one name birthplace activity miserly)
 (create-instance chose-one name birthplace activity miserly))
;;Value: "create-chose-one --> #[compound-procedure 66 create-chose-one]"

(define (chose-one self name birthplace activity miserly)
 (let ((wit-part (wit-student self name birthplace activity miserly)))
   (make-handler
    'chose-one
    (make-methods
     'SUFFER
	(lambda (hits perp)
	  (ask self 'SAY (list "Ouch!" "You can not hurt me!!!"))
	  (if (<= (- (ask wit-part 'health) hits) 0) (ask perp 'DIE self))
	  'CHOSE-ONE)
	)
    wit-part)))
;;Value: "chose-one --> #[compound-procedure 78 chose-one]"

(define create-wit-professor create-chose-one)
;;Value: "create-wit-professor --> #[compound-procedure 66 create-chose-one]"

(setup 'Plato)
;;Value: ready

(map (lambda (x) (ask x 'name)) (ask chamber-of-stata 'THINGS))
;;Value: (my-spell wind-of-doom slug-spell boil-spell)

(for-each 
(lambda (room) 
  (for-each
   (lambda (person)
     (clone-spell (cadr (ask chamber-of-stata 'THINGS)) person)
     )
   (find-all room 'wit-student)))
all-rooms)
;;Value: #[unspecified-return-value]

(ask clock 'TICK)

;--- the-clock Tick 0 --- 
;At student-center wit-student here my spell!
;At student-center ben-bitdiddle says -- Yaaaah! I am upset! 
;ben-bitdiddle moves from student-center to bexley 
;At bexley ben-bitdiddle says -- I take boil-spell from bexley 
;At stata-center wit-student here DOOM!!!!!!!
;At stata-center mr-bigglesworth says -- Ouch! 2 hits is more than I want! 
;alyssa-hacker moves from stata-center to 34-301 
;alyssa-hacker moves from 34-301 to edgerton-hall 
;At edgerton-hall alyssa-hacker says -- Hi dr-evil 
;At legal-seafood wit-student here DOOM!!!!!!!
;At legal-seafood course-6-frosh says -- Ouch! 1 hits is more than I want! 
;course-6-frosh moves from legal-seafood to edgerton-hall 
;At edgerton-hall course-6-frosh says -- Hi alyssa-hacker dr-evil 
;course-6-frosh moves from edgerton-hall to 34-301 
;At eecs-hq wit-student here habooic katarnum
;At eecs-hq lambda-man grows boils on their nose 
;lambda-man moves from eecs-hq to eecs-ug-office 
;At eecs-ug-office lambda-man says -- Hi susan-hockfield 
;At eecs-ug-office lambda-man says -- I take wind-of-doom from susan-hockfield 
;At eecs-ug-office susan-hockfield says -- I lose wind-of-doom 
;At eecs-ug-office susan-hockfield says -- Yaaaah! I am upset! 
;At eecs-ug-office wit-student here DOOM!!!!!!!
;At eecs-ug-office lambda-man says -- Ouch! 2 hits is more than I want! 
;susan-hockfield moves from eecs-ug-office to eecs-hq 
;At eecs-hq susan-hockfield says -- I take my-spell from eecs-hq 
;At great-court wit-student here DOOM!!!!!!!
;At great-court eric-grimson says -- Ouch! You can not hurt me!!! 
;eric-grimson moves from great-court to legal-seafood 
;At legal-seafood eric-grimson says -- I take boil-spell from legal-seafood 
;dr-evil moves from edgerton-hall to building-13 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;At stata-center mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from lobby-10 to building-13 
;At building-13 grendel says -- Hi dr-evil 
;grendel moves from building-13 to lobby-10 
;registrar moves from 6001-lab to eecs-hq 
;At eecs-hq registrar says -- Hi susan-hockfield 
;At eecs-hq registrar takes a bite out of susan-hockfield 
;At eecs-hq susan-hockfield says -- Ouch! You can not hurt me!!! 
;;Value: 0

(ask clock 'TICK)

;--- the-clock Tick 1 --- 
;At bexley wit-student here habooic katarnum
;At bexley ben-bitdiddle grows boils on their nose 
;ben-bitdiddle moves from bexley to baker 
;At baker ben-bitdiddle says -- I take wind-of-doom from baker 
;At edgerton-hall wit-student here DOOM!!!!!!!
;At edgerton-hall alyssa-hacker says -- Ouch! 1 hits is more than I want! 
;alyssa-hacker moves from edgerton-hall to building-13 
;At building-13 alyssa-hacker says -- Hi dr-evil 
;alyssa-hacker moves from building-13 to lobby-10 
;At lobby-10 alyssa-hacker says -- Hi grendel 
;At 34-301 wit-student here my spell!
;At 34-301 course-6-frosh says -- Yaaaah! I am upset! 
;course-6-frosh moves from 34-301 to stata-center 
;At stata-center course-6-frosh says -- Hi mr-bigglesworth 
;At eecs-ug-office wit-student here DOOM!!!!!!!
;At eecs-ug-office lambda-man says -- Ouch! 2 hits is more than I want! 
;At eecs-ug-office lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At eecs-ug-office lambda-man says -- I lose wind-of-doom 
;At eecs-ug-office lambda-man says -- Yaaaah! I am upset! 
;At eecs-ug-office lambda-man says -- I lose wind-of-doom 
;At eecs-ug-office lambda-man says -- Yaaaah! I am upset! 
;At eecs-ug-office lambda-man says -- I lose boil-spell 
;At eecs-ug-office lambda-man says -- Yaaaah! I am upset! 
;At eecs-ug-office lambda-man says -- I lose lambda-man-wand 
;At eecs-ug-office lambda-man says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;At eecs-hq wit-student here DOOM!!!!!!!
;At eecs-hq registrar says -- Ouch! 1 hits is more than I want! 
;susan-hockfield moves from eecs-hq to 34-301 
;At legal-seafood wit-student here dagnabbit ekaterin
;At legal-seafood A slug comes out of eric-grimson 's mouth. 
;eric-grimson moves from legal-seafood to great-court 
;eric-grimson moves from great-court to legal-seafood 
;At legal-seafood eric-grimson says -- I take slug from legal-seafood 
;dr-evil moves from building-13 to edgerton-hall 
;mr-bigglesworth moves from stata-center to stata-center 
;At stata-center mr-bigglesworth says -- Hi course-6-frosh 
;mr-bigglesworth moves from stata-center to stata-center 
;At stata-center mr-bigglesworth says -- Hi course-6-frosh 
;At stata-center mr-bigglesworth says -- I take my-spell from stata-center 
;At stata-center mr-bigglesworth says -- What are you doing still up? Everyone back to their rooms! 
;At stata-center course-6-frosh goes home to legal-seafood 
;grendel moves from lobby-10 to lobby-7 
;grendel moves from lobby-7 to lobby-10 
;At lobby-10 grendel says -- Hi alyssa-hacker 
;registrar moves from eecs-hq to 6001-lab 
;At 6001-lab registrar says -- Hi plato 
;registrar moves from 6001-lab to eecs-hq 
;At eecs-hq registrar 's belly rumbles 
;;Value: 1

(ask clock 'TICK)

;--- the-clock Tick 2 --- 
;At baker wit-student here DOOM!!!!!!!
;At baker ben-bitdiddle says -- Ouch! 1 hits is more than I want! 
;ben-bitdiddle moves from baker to bexley 
;At lobby-10 wit-student here DOOM!!!!!!!
;At lobby-10 grendel says -- Ouch! 2 hits is more than I want! 
;alyssa-hacker moves from lobby-10 to great-court 
;At great-court alyssa-hacker says -- I try but cannot take lovely-trees 
;At legal-seafood wit-student here DOOM!!!!!!!
;At legal-seafood course-6-frosh says -- Ouch! 2 hits is more than I want! 
;At legal-seafood course-6-frosh says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At legal-seafood course-6-frosh says -- I lose wind-of-doom 
;At legal-seafood course-6-frosh says -- Yaaaah! I am upset! 
;At legal-seafood course-6-frosh says -- I lose my-spell 
;At legal-seafood course-6-frosh says -- Yaaaah! I am upset! 
;At legal-seafood course-6-frosh says -- I lose course-6-frosh-wand 
;At legal-seafood course-6-frosh says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;At 34-301 wit-student here my spell!
;At 34-301 susan-hockfield says -- Yaaaah! I am upset! 
;susan-hockfield moves from 34-301 to edgerton-hall 
;At edgerton-hall susan-hockfield says -- Hi dr-evil 
;At edgerton-hall susan-hockfield says -- I take boil-spell from edgerton-hall 
;At legal-seafood wit-student here habooic katarnum
;At legal-seafood eric-grimson grows boils on their nose 
;eric-grimson moves from legal-seafood to edgerton-hall 
;At edgerton-hall eric-grimson says -- Hi susan-hockfield dr-evil 
;At edgerton-hall eric-grimson says -- I take susan-hockfield-wand from susan-hockfield 
;At edgerton-hall susan-hockfield says -- I lose susan-hockfield-wand 
;At edgerton-hall susan-hockfield says -- Yaaaah! I am upset! 
;dr-evil moves from edgerton-hall to building-13 
;At building-13 dr-evil says -- Grrr... When I catch those students... 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;At stata-center mr-bigglesworth says -- Grrr... When I catch those students... 
;grendel moves from lobby-10 to 10-250 
;grendel moves from 10-250 to barker-library 
;grendel moves from barker-library to 10-250 
;At 10-250 grendel 's belly rumbles 
;registrar moves from eecs-hq to 34-301 
;registrar moves from 34-301 to eecs-hq 
;At eecs-hq registrar 's belly rumbles 
;;Value: 2

(ask clock 'TICK)

;--- the-clock Tick 3 --- 
;At bexley wit-student here DOOM!!!!!!!
;At bexley ben-bitdiddle says -- Ouch! 2 hits is more than I want! 
;At bexley ben-bitdiddle says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At bexley ben-bitdiddle says -- I lose wind-of-doom 
;At bexley ben-bitdiddle says -- Yaaaah! I am upset! 
;At bexley ben-bitdiddle says -- I lose boil-spell 
;At bexley ben-bitdiddle says -- Yaaaah! I am upset! 
;At bexley ben-bitdiddle says -- I lose wind-of-doom 
;At bexley ben-bitdiddle says -- Yaaaah! I am upset! 
;At bexley ben-bitdiddle says -- I lose my-spell 
;At bexley ben-bitdiddle says -- Yaaaah! I am upset! 
;At bexley ben-bitdiddle says -- I lose ben-bitdiddle-wand 
;At bexley ben-bitdiddle says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;At great-court wit-student here DOOM!!!!!!!
;At great-court alyssa-hacker says -- Ouch! 1 hits is more than I want! 
;alyssa-hacker moves from great-court to graduation-stage 
;At edgerton-hall wit-student here 
;susan-hockfield moves from edgerton-hall to legal-seafood 
;At edgerton-hall wit-student here habooic katarnum
;At edgerton-hall eric-grimson grows boils on their nose 
;eric-grimson moves from edgerton-hall to legal-seafood 
;At legal-seafood eric-grimson says -- Hi susan-hockfield 
;eric-grimson moves from legal-seafood to edgerton-hall 
;dr-evil moves from building-13 to lobby-10 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;grendel moves from 10-250 to barker-library 
;grendel moves from barker-library to 10-250 
;grendel moves from 10-250 to barker-library 
;At barker-library grendel 's belly rumbles 
;registrar moves from eecs-hq to eecs-ug-office 
;registrar moves from eecs-ug-office to eecs-hq 
;At eecs-hq registrar 's belly rumbles 
;;Value: 3

(ask clock 'TICK)

;--- the-clock Tick 4 --- 
;At graduation-stage wit-student here DOOM!!!!!!!
;At graduation-stage alyssa-hacker says -- Ouch! 2 hits is more than I want! 
;At graduation-stage alyssa-hacker says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;At graduation-stage alyssa-hacker says -- I lose wind-of-doom 
;At graduation-stage alyssa-hacker says -- Yaaaah! I am upset! 
;At graduation-stage alyssa-hacker says -- I lose wind-of-doom 
;At graduation-stage alyssa-hacker says -- Yaaaah! I am upset! 
;At graduation-stage alyssa-hacker says -- I lose alyssa-hacker-wand 
;At graduation-stage alyssa-hacker says -- Yaaaah! I am upset! 
;An earth-shattering, soul-piercing scream is heard... 
;At legal-seafood wit-student here 
;susan-hockfield moves from legal-seafood to great-court 
;At great-court susan-hockfield says -- I try but cannot take lovely-trees 
;At edgerton-hall wit-student here habooic katarnum
;At edgerton-hall eric-grimson grows boils on their nose 
;eric-grimson moves from edgerton-hall to building-13 
;eric-grimson moves from building-13 to edgerton-hall 
;dr-evil moves from lobby-10 to great-court 
;At great-court dr-evil says -- Hi susan-hockfield 
;At great-court dr-evil says -- I take boil-spell from susan-hockfield 
;At great-court susan-hockfield says -- I lose boil-spell 
;At great-court susan-hockfield says -- Yaaaah! I am upset! 
;At great-court dr-evil says -- I'll let you off this once... 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to 34-301 
;grendel moves from barker-library to 10-250 
;grendel moves from 10-250 to barker-library 
;registrar moves from eecs-hq to 6001-lab 
;At 6001-lab registrar says -- Hi plato 
;At 6001-lab registrar takes a bite out of plato 
;At 6001-lab plato says -- Ouch! 2 hits is more than I want! 
;;Value: 4

(ask clock 'TICK)

;--- the-clock Tick 5 --- 
;At great-court wit-student here 
;susan-hockfield moves from great-court to graduation-stage 
;At graduation-stage susan-hockfield says -- I take boil-spell from graduation-stage 
;At edgerton-hall wit-student here DOOM!!!!!!!
;At edgerton-hall eric-grimson says -- Ouch! You can not hurt me!!! 
;eric-grimson moves from edgerton-hall to building-13 
;eric-grimson moves from building-13 to edgerton-hall 
;dr-evil moves from great-court to lobby-10 
;mr-bigglesworth moves from 34-301 to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;At stata-center mr-bigglesworth says -- I take sicp from stata-center 
;grendel moves from barker-library to 10-250 
;At 10-250 grendel 's belly rumbles 
;registrar moves from 6001-lab to eecs-hq 
;At eecs-hq registrar 's belly rumbles 
;;Value: 5

(ask clock 'TICK)

;--- the-clock Tick 6 --- 
;At graduation-stage wit-student here 
;susan-hockfield moves from graduation-stage to great-court 
;At great-court susan-hockfield says -- I take boil-spell from great-court 
;At edgerton-hall wit-student here dagnabbit ekaterin
;At edgerton-hall A slug comes out of eric-grimson 's mouth. 
;eric-grimson moves from edgerton-hall to 34-301 
;At 34-301 eric-grimson says -- I take slug-spell from 34-301 
;dr-evil moves from lobby-10 to building-13 
;dr-evil moves from building-13 to edgerton-hall 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;grendel moves from 10-250 to barker-library 
;grendel moves from barker-library to 10-250 
;At 10-250 grendel 's belly rumbles 
;registrar moves from eecs-hq to eecs-ug-office 
;registrar moves from eecs-ug-office to eecs-hq 
;;Value: 6

(ask clock 'TICK)

;--- the-clock Tick 7 --- 
;At great-court wit-student here 
;susan-hockfield moves from great-court to lobby-10 
;At lobby-10 susan-hockfield says -- I take slug-spell from lobby-10 
;At 34-301 wit-student here dagnabbit ekaterin
;At 34-301 A slug comes out of eric-grimson 's mouth. 
;eric-grimson moves from 34-301 to edgerton-hall 
;At edgerton-hall eric-grimson says -- Hi dr-evil 
;eric-grimson moves from edgerton-hall to legal-seafood 
;At legal-seafood eric-grimson says -- I take wind-of-doom from legal-seafood 
;dr-evil moves from edgerton-hall to 34-301 
;dr-evil moves from 34-301 to eecs-hq 
;At eecs-hq dr-evil says -- Hi registrar 
;At eecs-hq dr-evil says -- What are you doing still up? Everyone back to their rooms! 
;At eecs-hq registrar goes home to 6001-lab 
;mr-bigglesworth moves from stata-center to stata-center 
;mr-bigglesworth moves from stata-center to stata-center 
;grendel moves from 10-250 to barker-library 
;grendel moves from barker-library to 10-250 
;grendel moves from 10-250 to lobby-10 
;At lobby-10 grendel says -- Hi susan-hockfield 
;At lobby-10 grendel takes a bite out of susan-hockfield 
;At lobby-10 susan-hockfield says -- Ouch! You can not hurt me!!! 
;At lobby-10 grendel says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;An earth-shattering, soul-piercing scream is heard... 
;registrar moves from 6001-lab to eecs-hq 
;At eecs-hq registrar says -- Hi dr-evil 
;;Value: 7


;;; The reason why we can not only overwrite DIE method is the chose-one will suffer first before he is about to die.

;;; Computer Exercise 11
;;; I'd like to design a hero class which is inherit from chosen one and avatar, and his goal is killed all trolls in the world;
(define (create-hero name birthplace)
 (create-instance hero name birthplace))
;Value: "create-hero --> #[compound-procedure 18 create-hero]"


(define (hero self name birthplace)
 (let ((chosen-part (chose-one self name birthplace 999 1))
       (avatar-part (avatar self name birthplace)))
   (make-handler
    'hero
    (make-methods
     'FEEL-TROLLS
     (lambda ()
       (append-map 
	(lambda (room) (find-all room 'troll))
	all-rooms)
       )
     'INSTALL
      (lambda ()
	(ask chosen-part 'INSTALL)
	(ask avatar-part 'INSTALL)
	;;Anybody else can not take my wand!
	(create-ring-of-obfuscation 'the-king-of-ring self)
	(for-each 
	 (lambda (x)
	   (clone-spell x self))
	 (ask chamber-of-stata 'THINGS))
	)
      'MOVE-SOMEWHERE
      (lambda ()
	(ask chosen-part 'MOVE-SOMEWHERE)
	(ask self 'KILL-TROLL)
	)
      'KILL-TROLL
      (lambda ()
	(let ((troll (pick-random (find-all (ask self 'location) 'troll)))
	      (wand (pick-random (find-all self 'wand))))
	  (if (null? troll)
	      (ask self 'say (list "No trolls here"))
	      (begin
		   (ask self 'say (list "Cleaning the world"))
		   (ask wand 'ZAP troll)
		   (if (null? (ask self 'FEEL-TROLLS))
		       (ask self 'say (list "The whole world is clean now!"))
		       )
		   )
	      )
	  )
	)
     )
    chosen-part avatar-part)))
;Value: "hero --> #[compound-procedure 79 hero]"

(define create-avatar create-hero)
;Value: "create-avatar --> #[compound-procedure 18 create-hero]"

(setup 'Plato)
;Value: ready

(ask screen 'DEITY-MODE #f)
;Value: #f


(ask clock 'TICK)

--- the-clock Tick 0 --- habooic katarnumcounter spell!dagnabbit ekaterincounter spell!It has counter-spell!!!DOOM!!!!!!!my spell!It has counter-spell!!!
eric-grimson moves from legal-seafood to great-court 
An earth-shattering, soul-piercing scream is heard... 
At legal-seafood wit-student here habooic katarnumIt has counter-spell!!!
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world dagnabbit ekaterin
At 34-301 A slug comes out of registrar 's mouth. 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world counter spell!
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world counter spell!
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world counter spell!
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world DOOM!!!!!!!
At bexley grendel says -- Ouch! 1 hits is more than I want! 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world dagnabbit ekaterin
At bexley A slug comes out of grendel 's mouth. 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world habooic katarnum
At bexley grendel grows boils on their nose 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world my spell!
At bexley grendel says -- Yaaaah! I am upset! 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world counter spell!
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- Hi grendel 
At bexley plato says -- Cleaning the world DOOM!!!!!!!
At bexley grendel says -- Ouch! 2 hits is more than I want! 
At bexley grendel says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world DOOM!!!!!!!
At 34-301 registrar says -- Ouch! 1 hits is more than I want! 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world counter spell!
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world counter spell!
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world dagnabbit ekaterin
At 34-301 A slug comes out of registrar 's mouth. 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world habooic katarnum
At 34-301 registrar grows boils on their nose 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world my spell!
At 34-301 registrar says -- Yaaaah! I am upset! 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world habooic katarnum
At 34-301 registrar grows boils on their nose 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- Hi registrar 
At 34-301 plato says -- Cleaning the world DOOM!!!!!!!
At 34-301 registrar says -- Ouch! 2 hits is more than I want! 
At 34-301 registrar says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
At 34-301 plato says -- The whole world is clean now! 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to baker 
At baker plato says -- No trolls here 
plato moves from baker to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to bexley 
At bexley plato says -- No trolls here 
plato moves from bexley to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to stata-center 
At stata-center plato says -- No trolls here 
plato moves from stata-center to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to eecs-ug-office 
At eecs-ug-office plato says -- No trolls here 
plato moves from eecs-ug-office to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 6001-lab 
At 6001-lab plato says -- Hi susan-hockfield alyssa-hacker 
At 6001-lab plato says -- No trolls here 
plato moves from 6001-lab to eecs-hq 
At eecs-hq plato says -- Hi dr-evil 
At eecs-hq plato says -- No trolls here 
plato moves from eecs-hq to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to 34-301 
At 34-301 plato says -- No trolls here 
plato moves from 34-301 to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to graduation-stage 
At graduation-stage plato says -- No trolls here 
plato moves from graduation-stage to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to edgerton-hall 
At edgerton-hall plato says -- No trolls here 
plato moves from edgerton-hall to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to building-13 
At building-13 plato says -- Hi lambda-man 
At building-13 plato says -- No trolls here 
plato moves from building-13 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to legal-seafood 
At legal-seafood plato says -- No trolls here 
plato moves from legal-seafood to great-court 
At great-court plato says -- Hi eric-grimson 
At great-court plato says -- No trolls here 
plato moves from great-court to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to student-center 
At student-center plato says -- No trolls here 
plato moves from student-center to lobby-7 
At lobby-7 plato says -- No trolls here 
plato moves from lobby-7 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to barker-library 
At barker-library plato says -- No trolls here 
plato moves from barker-library to 10-250 
At 10-250 plato says -- Hi mr-bigglesworth 
At 10-250 plato says -- No trolls here 
plato moves from 10-250 to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
plato moves from grendels-den to lobby-10 
At lobby-10 plato says -- No trolls here 
plato moves from lobby-10 to grendels-den 
At grendels-den plato says -- No trolls here 
At grendels-den plato says -- I take counter-spell from grendels-den 
;Value: 0


