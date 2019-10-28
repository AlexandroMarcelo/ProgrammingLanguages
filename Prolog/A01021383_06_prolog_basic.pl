/*
Alexandro Francisco Marcelo Gonzalez A01021383
Tarea: 06_Prolog_basic
Generate relationships in Prolog to determine the following about a list:
*/

/*
in_list : Take two arguments, a list and an element, and determine if the element can be found inside the list.
Example:
?- in_list([e, h, s, y, u, c, a, w, h], u).
    true
*/

% Base Case, and i insert a cut ('!') to stop continuing analysing others cases 
in_list([H|_], H):-
    !. 
% Recursive step
in_list([_|T], E) :-
    in_list(T, E).


/*
odd_length : Take as argument a list, and determine if the list has an odd number of elements or not. 
Example: 
?- odd_length([e, h, s, y, u, c, a, w, h]).
    false.
*/

odd_length(L) :-
    % arguments: L (the orignal list), -1 (to know if the length is odd or even), _S (to have the final result of the length (The underscore is to remove the warning singleton variable))
    odd_length_helper(L, -1, _S).

% Base Case
odd_length_helper([], L, L).
% Recursive step
odd_length_helper([_|T], A, S) :-
    A1 is A * (-1), % Multiplying -1 to know if the length is odd or even
    odd_length_helper(T, A1, S),
    is_odd(S). % To know if the length is odd according to the fact
is_odd(1).


/*
n_th_element : Take as argument an index and a list, and return the element at index n of the list. Indices start at 0. 
Example:
?- element_at(2, [a, b, c, d, e, f], X).
    X = c .
*/

element_at(N, L, X) :-
    % Im passing another argument to carry a counter to verify if it is the same as the n given by the user
    element_at_helper(N, L, X, 0).

% Base Case, the counter is the same as the given n and return the value in that position
element_at_helper(N, [X|_], X, N) :- !.
% Recursive step
element_at_helper(N, [_|T], X, C) :-
    C1 is C + 1,
    element_at_helper(N, T, X, C1).


/*
is_permutation : Take two lists as arguments, and determine if they are permutations of each other. That is, they have the exact same elements, but in different orders. 
Example:
?- is_permutation([1, 2, 3, 4, 5, 6], [4, 3, 2, 5, 7, 1]).
    false.

?- is_permutation([1, 2, 3, 4, 5, 6], [4, 3, 2, 5, 6, 1]).
    true.
*/

% See if the given lists have the same length, otherwise returns false
is_permutation(L1, L2) :-
    length(L1, S1),
    length(L2, S2),
    S1 = S2,
    is_permutation_helper(L1, L2).

% Base Case, the list is empty
is_permutation_helper([], _).
% Recursive step
is_permutation_helper([H1|T1], L2) :-
    check_element(H1, L2, X), % Calling another function to found if the Head of the first list is in the second list, and so on
    X = H1, % Comparing if the founded element is the same as the Head of the first list
    is_permutation_helper(T1, L2). 

% Base Case, the element is in the list, then return it
check_element(H, [H|_], H) :- !.
% Recursive step
check_element(E, [_|T], X) :-
    check_element(E, T, X).


/*
remove_doubles: Take as argument a list, and generate a list without contiguous elements that are duplicated. 
Example: 
?- tec_remove_doubles([1, 1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 7, 8, 8], R).
    R = [1, 2, 3, 4, 5, 6, 7, 8]
*/

% Function to remove the diplicated element in the list
remove_duplicates(H, L, R) :-
    subtract(L, [H], R).

% Base Case, the lists are empty
tec_remove_doubles([],[]).
% Recursive step
tec_remove_doubles([H|T], [H|R]) :- 
    member(H,T), % Check if the Head is in the rest of the list 
    remove_duplicates(H, T, R1), % Call the funcion to remove duplicates
    tec_remove_doubles(R1, R).
% Adding the element to the result R and propagating the function
tec_remove_doubles([H|T], [H|R]) :-
    tec_remove_doubles(T,R).
