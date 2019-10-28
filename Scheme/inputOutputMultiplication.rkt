#|
Using input/output functions to create an interface

Alexandro Marcelo
|#

(define (ui)
	(display "Enter number 1: ")
	(define num1 (read))
	(display "Enter number 2: ")
	(define num2 (read))
	(define result (* num1 num2))
	(display (string-append "The multiplication is " (number->string result)))
)

; Call the function
(ui)