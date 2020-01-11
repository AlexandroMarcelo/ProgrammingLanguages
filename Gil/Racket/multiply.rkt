#|
Recursive multiplication function
|#

(define (multiply a b)
    (case b
        [(0) 0]
        [(1) a]
        [else (+ a (multiply a (- b 1)))]))

; Entry for the tail recursion version
(define (multiply_2 a b)
    (multiply_tail a b 0))

(define (multiply_tail a b result)
    (if (<= b 0)
        result
        (multiply_tail a (- b 1) (+ result a))))

; Single function with an internally defined one for tail recursion
(define (multiply_3 a b)
    ; Use a named let to create a function
    (let loop ( [a a]
                [b b]
                [result 0])
        (if (<= b 0)
            result
            (loop a (- b 1) (+ result a)))))

