#|
Find numbers that are divisible up to the input

Gilberto Echeverria
|#


; Check if test is divisible by all integers from 2 to limit
(define (divisible? test limit)
    (if (= limit 1)
        #t
        (if (= 0 (remainder test limit))
            (divisible? test (- limit 1))
            #f)))

; Find the smallest integer divisible by all numbers from 2 to limit
(define (divisible-up-to limit)
    (let loop
        (   [test (* limit (- limit 1))]
            [limit limit])
        (if (divisible? test limit)
            ; This candidate is already the solution
            test
            ; Check a different candidate
            (loop (+ test limit) limit))))
