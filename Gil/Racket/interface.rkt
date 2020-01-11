#|
Using input/output functions to create an interface

Gilberto Echeverria
|#

; A function to ask the user for values and provide a result
(define (ui)
    (display "Enter number 1: ")
    (define num1 (read))
    (display "Enter number 2: ")
    (define num2 (read))
    (define result (* num1 num2))
    (display
         (string-append "The multiplication is " (number->string result))))

; Call the function
(ui)
