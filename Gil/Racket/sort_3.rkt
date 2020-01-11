#|
Function to sort 3 numbers

Gilberto Echeverria
|#

(define (sort_3 a b c)
    (cond
        [(and (<= a b) (<= b c)) (list a b c)]
        [(and (<= a c) (<= c b)) (list a c b)]
        [(and (<= b a) (<= a c)) (list b a c)]
        [(and (<= b c) (<= c a)) (list b c a)]
        [(and (<= c a) (<= a b)) (list c a b)]
        [(and (<= c b) (<= b a)) (list c b a)]
    )

    #|
    (case a
        [(1 2 3 4) "less than 5"]
        [(6 7 8 9) "greater than 5"]
    )
    |#
)
