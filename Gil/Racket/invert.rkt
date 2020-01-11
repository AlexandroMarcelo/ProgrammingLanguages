#|
Reimplementationof the 'invert' function

Gilberto Echeverria
|#

(define (invert-list data)
    (if (empty? data)
        empty
        (append
             (invert-list (cdr data))
             (list (car data)))))

