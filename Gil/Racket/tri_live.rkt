#|
Solution to computing the area of a triangle
from the lengths of its sides

Gilberto Echeverria
|#

(define (s a b c)
    (/ (+ a b c) 2))

(define (area a b c)
    (sqrt (* (s a b c) (- (s a b c) a) (- (s a b c) b) (- (s a b c) c))))
