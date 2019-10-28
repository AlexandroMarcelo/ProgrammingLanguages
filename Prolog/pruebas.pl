
/*
delete3(_,[],[]).
delete3(X,[X|T],R) :-
    delete3(X,T,R).

delete3(X,[H|T],[H|R]) :-
    delete3(X,T,R).



remove_duplicates([],[]).
remove_duplicates([H|T], [H|R]) :- 
    member(H,T),
    delete3(H,T,R1),
    remove_duplicates(R1,R).

remove_duplicates([H|T],[H|R]):-
    remove_duplicates(T,R).





% remdup(List, List_No_duplicates).
remdup([],[]).
remdup([H|T],Lnd) :- 
    rd1(H,T,T1), 
    remdup(T1,Tnd),
    Lnd=[H|Tnd].
% rd1(X,L,Lr) removes all occurance of X in List L and store result in List Lr
rd1(_,[],[]).    
rd1(X,[X|T],Lx) :-
    rd1(X,T,Lx).
rd1(X,[Y|T],Lx):-
    rd1(X,T,Lx1),Lx=[Y|Lx1].


tec_remove_doubles(L, R) :-
    tec_remove_doubles_helper(L, 0, I, L).

tec_remove_doubles_helper([H|T], C, C, L).
tec_remove_doubles_helper([H|T], C, I, L) :-
    tec_remove_doubles_get_index(H, L, C, I, L),
    \+ C = I,
    element_at(I, L, X),
    tec_remove_doubles(T, C1, I, L).

tec_remove_doubles_get_index(E, [E|_], C, C, L)
tec_remove_doubles_get_index(E, [_|T], C, I, L) :-
    element_at(C, L, X),
    C1 is C + 1,
    tec_remove_doubles_get_index(E, T, C1, I, L),




tec_remove_doubles(L, R) :-
    tec_remove_double(L, R, L).

tec_remove_double([H|T], R, L) :-
    tec_remove_doubles_helper(H, T, 0, I),
    element_at(I, L, X),
    append([X], [X], R),
    tec_remove_double(T, R, L).

tec_remove_doubles_helper(H, [H|_], C, C) :- !.
tec_remove_doubles_helper(E, [_|T], C, I) :-
    C1 is C + 1,
    tec_remove_doubles_helper(E, T, C1, I).

*/