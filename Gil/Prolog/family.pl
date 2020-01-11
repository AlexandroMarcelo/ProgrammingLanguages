/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock

Gilberto Echeverria
02/10/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
father(dr_brief, bulma).    % NEW
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
mother(panchy, bulma).  % NEW
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
male(raditz).
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
    male(X).

sister(X, Y) :-
    brothers(X, Y),
    female(X).

% Father side
grandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).

% Mother side
grandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

