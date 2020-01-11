#|
List comprehensions

Gilberto Echeverria
30/09/2019
|#

; Compute the square of each element in 'data'
(define (squares data)
    (let loop
        (   [lst data]
            [results empty])
        (if (empty? lst)
            results
            ; Square only even numbers
            (if (= (remainder (car lst) 2) 0)
                (loop (cdr lst) (append results (list (* (car lst) (car lst)))))
                (loop (cdr lst) results)))))
            


; Using map and lambda functions
(define (squares-map data)
    (map (lambda (x) (* x x)) data))


; Using list comprehensions
(define (squares-for data)
    (for/list
        (   [i data]
            ; Add only the squares of even numbers
            #:when (= (remainder i 2) 0) )
        (* i i)))

; Using two lists as input, the iteration finishes at the end
;  of the shortest of the lists
(define (parallel names)
    (for/list
        ; Generate numbers without a limit
        (   [num (in-range 8)]
            [name names])
        (string-append (number->string num) ": Super-" name)))
