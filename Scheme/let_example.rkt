#|
Alexandro Marcelo A01021383
9 septiembre 2019

funcionamiento de list
|#
;let* para mandar a llamar sus propias definiciones
;sin * es para no llamar
(let* 
    ([a 2] [b 3] [c (+ a b)])
    (* a b c)
)

(let
    ([p 1] [r 2])
    (* p r)
)

(printf "hola ~a ~a ~a" 'mundo 666 '(1 3 51))
