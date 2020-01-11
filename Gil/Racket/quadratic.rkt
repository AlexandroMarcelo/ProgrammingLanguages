#|
Program to solve quadratic equations of the form
ax^2 + bx + c = 0

Gilberto Echeverria
30/08/2019
|#

; Function to give the solution to the equation
; Returns a list with either one or two solutions to the equation
(define (quadratic a b c)
    (if (equal? a 0)
        ; true
        (list (/ (- c) b))
        ; false
        (let
            (   [d (- (* b b) (* 4 a c))]
                [2a (* 2 a)]
                [-b (- b)])
            (if (= d 0)
                ; When the determinant is equal to 0, there is only one solution
                (list (/ -b 2a))
                ; Otherwise there are two solutions
                (list
                    (/ (+ -b (sqrt d)) 2a)
                    (/ (- -b (sqrt d)) 2a))))))

; Function to get input from the user
(define (get_args)
    (display "Enter the values for 'a', 'b' and 'c': ")
    (quadratic (read) (read) (read)))

(get_args)
