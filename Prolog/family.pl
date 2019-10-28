/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock
Alexandro Marcelo
02/10/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(gine).
female(chichi).
female(bulma).
female(bulla).

% Rules
brothers(X, Y) :-
    father(Z, X),
    father(Z, Y),
    mother(W, X),
    mother(W, Y),
    X \= Y.

brother(X, Y) :-
    brothers(X, Y),
    male(X, Y).

sister(X, Y) :-
    brothers(X, Y),
    female(X, Y).

grandfather(X, Y) :-
    father(Z, Y),
    father(X, Z);
    mother(W, Y),
    father(X, W).

grandmother(X, Y) :-
    father(Z, Y),
    mother(X, Z);
    mother(W, Y),
    mother(X, W).

grandchild(X, Y) :-
    father(Z, X),
    father(Y, Z);
    mother(W, X),
    mother(Y, W);
    father(P, X),
    mother(Y, P);
    mother(P, X),
    father(Y, P).

grandson(X, Y) :-
    father(Z, X),
    father(Y, Z),
    male(X);
    mother(W, X),
    mother(Y, W),
    male(X).

granddaughter(X, Y) :-
    father(Z, X),
    father(Y, Z),
    female(X).
