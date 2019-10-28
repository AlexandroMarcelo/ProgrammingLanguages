/*
Hello world in prolog

Alexandro Marcelo
03/10/2019
*/

%Facts
man(socrates).
man(alex).

father(goku,gohan).

%Rules
mortal(X) :- man(X).

/*
% consult('hello_world.pl') para recargar la base de datos
o ['hello_world.pl']

; es para que te muestre mas cosas de la base de datos:
    ?- man(X).
    X = socrates ;
    X = alex.
Se usan variables como X Y para saber parejas de los Facts:
    ?- father(X,Y).
    X = goku,
    Y = gohan.

, es and en un if
\= es diferente (!=) se pone al final de las evaluaciones
*/