/*
Hello world in Prolog

Gilberto Echeverria
03/10/2019
*/

% Facts
man(socrates).
man(gil).

% Rules
mortal(X) :- man(X).
