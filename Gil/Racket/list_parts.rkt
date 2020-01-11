#|
Using the functions car and cdr to work with lists

car returns the first element of a list
cdr returns the rest of the list, without the first element

Gilberto Echeverria
|#

; Using the functions nested
(car
    (car
         (cdr '( (1 2 3) (a b c) (7 8 9) ))))

; This is equivalent to the previous expression
(caadr '( (1 2 3) (a b c) (7 8 9) ))
