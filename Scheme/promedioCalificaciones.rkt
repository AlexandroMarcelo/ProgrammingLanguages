#|
Alexandro Marcelo

Hacer una función que reciba 3 calificaciones y nos regrese un string diciendo “aprobado” o “reprobado”, de acuerdo a su promedio (< 70, reprobado).
|#

(define (grade g1 g2 g3)
	(if (< (/ (+ g1 g2 g3) 3) 70)(display "Reprobado")(display "Aprobado"))
)

#|
Hacer una función que reciba un año y nos diga si es bisiesto o no (se debe investigar la función adecuada).
|#

(define (bisiesto anio)
	(if (= (modulo anio 400) 0) (display "Es bisiesto") (if (and (= (modulo anio 4) 0) (> (modulo anio 4) 0)) (display "Es bisiesto") (display "No es bisiesto")))
)

#|
Hacer una función que reciba 3 números y nos regrese el mayor de los 3 (extraño la asignación).
|#


(define (mayor n1 n2 n3)
	(cond
		[(and (> n1 n2) (> n1 n3)) (display n1)]
		[(and (> n2 n1) (> n2 n3)) (display n2)]
		[(and (> n3 n2) (> n3 n1)) (display n3)]
	)
)

#|
Hacer una función que reciba una lista de 3 números y nos regrese la lista ordenada (y los ciclos también los extraño).

|#

(define (ordenada n1 n2 n3)
	(cond
		[(and (> n1 n2) (> n2 n3)) (display (list n1 n2 n3))]
		[(and (> n2 n1) (> n1 n3)) (display (list n2 n1 n3))]
		[(and (> n3 n2) (> n2 n1)) (display (list n3 n2 n1))]
		[(and (> n2 n3) (> n3 n1)) (display (list n2 n3 n1))]
		[(and (> n3 n1) (> n1 n2)) (display (list n3 n1 n2))]
		[(and (> n1 n3) (> n3 n2)) (display (list n1 n3 n2))]
	)
)

#|
Alexandro Francisco Marcelo Gonzalez A01021383

Homework: Quadratic equation
Program that can solve quadratic equations of the form: ax^2+bx+c=0


(define (quadratic a b c)
    ;(define x1(/ (+ (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a) ) )
    (define x2(/ (- (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a) ) )
    ;(display(/ (+ (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a)))
    ;(define x1 (* b c))
    ;(define x2 (+ b c))
	;(define result (* a b))
	;(display (string-append "The multiplication is " (number->string x1)))
    ;(display(number->string x1))
    (define x1 (/ (+ (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a) ))
    (list x1 x2)
)


(define (quadratic a b c)
    (if (= a 0)
        (list (/ (* c -1.0) b))
        
        (list (/ (- (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a) )
        (/ (+ (* b -1) (sqrt(- (expt b 2) (* 4 a c) ) ) ) (* 2 a) ))
    )
)
|#




