#|
Alexandro Marcelo A01021383
9 septiembre 2019

suma de los elementos de una lista usando ciclos (recursion)
|#

(define (sumList lista)
    (if(empty? lista)
        0
        (+ (car lista) (sumList (cdr lista)))
    )
)

;car regresa el primer elemento de la lista
;cdr te quita el primer elemento de la lista
