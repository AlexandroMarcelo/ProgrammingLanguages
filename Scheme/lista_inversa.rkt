#|
Alexandro Marcelo

Funcion recibe una lista y la devuelve invertida, usando ciclos (recurion)
|#

(define (invertir lista)
    (invertir_lista lista (list (last lista)))
)

(define (invertir_lista lista lista_invertida)
    (if (empty? lista)
        (display lista_invertida)
        (invertir_lista (cdr lista) (append (list (car lista)) lista_invertida))
    )
)
