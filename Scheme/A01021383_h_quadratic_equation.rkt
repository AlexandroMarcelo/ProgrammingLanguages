#|
Alexandro Francisco Marcelo Gonzalez A01021383

Homework: Quadratic equation
Program that can solve quadratic equations of the form: ax^2+bx+c=0
|#

(define (quadratic a b c)
    (if (= a 0) ;if the ecuation has one or two solutions
        (oneSolution b c) ;call the function to calculate the one solution equation
        (twoSolutions a b c) ;call the function to calculate the equation with two solutions
    )
)

(define (oneSolution b c) ;function to calculate the one solution equation a = 0
    (define x(/ (* c -1.0) b)) ;setting and calculating the value of x
    (list x) ;displaying as a list
)

(define (twoSolutions a b c) ;function to calculate the equation with two solutions
    ;using the square root function for the (b^2 - 4ac) and the pow function for the b^2 
    (define square_root_content(- (expt b 2) (* 4 a c) ))
    ;(display square_root_content) ;debug purpose
    (if (> square_root_content 0) ;avoid negative square root
        (list (/ (- (* b -1) (sqrt square_root_content) ) (* 2 a) ) (/ (+ (* b -1) (sqrt square_root_content) ) (* 2 a) ) ) ;listing and showing the two solutions (x1 and x2)
        (display "There is not a solution for the given equation") ;because the content of the square root can not be negative
    )
)
