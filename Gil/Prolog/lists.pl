/*
Examples of using lists in Prolog

Gilberto Echeverria
10/10/2019
*/

%%%% Last element in the list
% Base case, a list with only one element
tec_last([H|[]], H).
% Recursive rule
tec_last([_|T], L) :-
    tec_last(T, L).

% Fact, base case
tec_length([], 0).
% Recursive rule
tec_length([_|T], L) :-
    tec_length(T, L1),
    L is L1 + 1.

%%%% Tail recursion for finding the length of the list
% Fact, base case
tec_length([], L, L).
% Recursive rule
tec_length([_|T], A, L) :-
    A1 is A + 1,
    tec_length(T, A1, L).


% Reverse a list
tec_reverse(L, R) :-
    reverse_helper(L, R, []).
% Base case fact
reverse_helper([], R, R).
% Recursive rule
reverse_helper([H|T], R, A) :-
    reverse_helper(T, R, [H|A]).


% Append two lists
% Base case fact
tec_append([], L, L).
% Recursive rule
tec_append([H1|T1], L2, [H1|R]) :-
    tec_append(T1, L2, R).


% Double the elements of a list
% Base case fact
double_elements([], []).
% Recursive rule
double_elements([H|T], [X|R]) :-
    X is H * 2,
    double_elements(T, R).


% Flatten a list that may contain other lists
tec_flatten([], []).
% Flatten a non list item into a list to be appended
tec_flatten(X, [X]) :-
    % Not is used as not provable ( \+ )
    \+ is_list(X).
% Recrusive case to flatten both the head and the tail
tec_flatten([H|T], R) :-
    tec_flatten(H, FlatHead),
    tec_flatten(T, FlatTail),
    append(FlatHead, FlatTail, R).
