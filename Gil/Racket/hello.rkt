#|
First program in Racket
    Valid extensions: .rkt or .scm

Gilberto Echeverria
02/09/2019
|#

; Create a greeting function
(define (greeting name)
    (display (string-append "hello " name "!")))
