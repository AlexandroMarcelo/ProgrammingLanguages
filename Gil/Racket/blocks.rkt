#|
Using the 'begin' function to create a block of several instructions
Only to be used for user interfaces

Gilberto Echeverria
12/09/2019
|#

#lang racket

(if (= 2 3)
    (display "bien\n")
    ; else
    (begin
        (display "mal\n")
        (display "MUY MAL\n")))

