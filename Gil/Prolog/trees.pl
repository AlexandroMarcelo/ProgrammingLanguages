/*
Implementations of binary search trees in Prolog

Gilberto Echeverria
21/10/2019
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).
test_tree(3, node(45, node(12, node(3, nil, nil), node(23, nil, nil)), node(52, node(48, nil, nil), node(59, nil, nil)))).


%%% Predicate to determine if an expression is a valid tree
% Base case fact
is_tree(nil).
% Recursive calls
is_tree(node(_, LT, RT)) :-
    is_tree(LT),
    is_tree(RT).

%%% Search for an element inside the tree
tree_element(X, node(R, _, _)) :-
    X = R.
tree_element(X, node(R, LT, _)) :-
    X < R,
    tree_element(X, LT).
tree_element(X, node(R, _, RT)) :-
    X > R,
    tree_element(X, RT).

%%% Insert a new element X in the tree. The result is NewTree
% Base case
tree_insert(X, nil, node(X, nil, nil)).
% If the element is already in the tree, do nothing
tree_insert(X, node(R, LT, RT), node(R, LT, RT)) :-
    X = R.
tree_insert(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT).
tree_insert(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_insert(X, RT, NRT).

%%% Convert a tree into an ordered list
tree_inorder(nil, []).
tree_inorder(node(R, LT, RT), L) :-
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R|RL], L).

%%% Print a nicely formatted tree
print_tree(nil, 0, _).
%print_tree(Tree, Depth, Char).


%%% Delete an element from the tree
tree_delete(_, nil, nil).
% Find the element
tree_delete(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_delete(X, LT, NLT).
tree_delete(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_delete(X, RT, NRT).
% Delete the element found
% Leaf node
tree_delete(X, node(X, nil, nil), nil).
% Only one branch
tree_delete(X, node(X, LT, nil), LT).
tree_delete(X, node(X, nil, RT), RT).
% Two branches
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)) :-
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).

% Find the smallest number in a tree
tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min) :-
    tree_min(LT, Min).
