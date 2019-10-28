#|
Second program in Racket, converting Celsius to Farenheit and viceversa
	Valid extensions: 
|#
; Create a greeting function
(define (F->C f)
	(display (* (- f 32) .5556))
)

(define (C->F c)
	(display (+ (* c 1.8) 32))
)

(define (longitud a b c)
	(display 
		(sqrt ( * (/ (+(+ a b) c) 2)  (* (- (/ (+(+ a b) c) 2) a)  (* (- (/ (+(+ a b) c) 2) b)  (- (/ (+(+ a b) c) 2) c)))))

	)
)


#|

(define (s a b c)
	(/()))
|#
