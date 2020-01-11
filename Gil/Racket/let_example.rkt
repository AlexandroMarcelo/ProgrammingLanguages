#|
Using let to create scoped variables, usable within an expression

Gilberto Echeverria
|#

(let*
    ; Declare variables
    (   [a 3]
        [b -12]
        [c (+ a b)])    ; let* allows us to use the previous variables to declare new ones
    ; Expression where the variables are used
    (* a b c))
