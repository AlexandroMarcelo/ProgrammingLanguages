#|
Alexandro Marcelo A01021383
9 septiembre 2019

funcionamiento de ciclos
|#

(define (multiply a b)
    (case b
        [(0) 0]
        [(1) a]
        [else (+ a (multiply a (- b 1)))] 
    )
)

(define (multiply_2 a b)
    (multiply_tail a b 0)
)

(define (multiply_tail a b result)
    (if (<= b 0)
        result
        (multiply_tail a (- b 1) (+ result a))
    )
)

