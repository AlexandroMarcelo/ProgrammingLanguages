/*
Implementations of binary search trees in Prolog

Alexandro Marcelo Gonzalez A01021383
11/11/2019
Based on Gilberto Echeverria`s code
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).
% Others trees
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



/*
    HOMEWORK: 

    Complete the following predicates to work with trees in Prolog:
        tree_height: Compute the height of the tree. Two parameters, the tree and the resulting height
        list_leaves: Generate a list of all the elements at the leafs of the tree (nodes without children). Two parameters, the tree and the resulting list
        symmetric_tree: Determine if a tree has the same structure on its left and right branches, inverted. Only parameter is a tree
        mirror_tree: Used to solve the previous predicate. Compare two trees to see if they have a mirrored structure. Two arguments, both trees
*/

%%% Print a nicely formatted tree
print_tree(T) :-
    % Calling a helper function to giving the format of the tree
    % The parameters are: (Tree, Depth, SideBranch(0=RightSide, 1=LeftSide))
    print_tree_helper(T,1,0).

% Base Case: There are not leafs left
print_tree_helper(nil, _, _).

% Recursive Case:
% The parameters are: (GivenTree, CurrentDepth, SideOfBranchForPrintingSlash(0=RightSide, 1=LeftSide))
print_tree_helper(node(R, LT, RT), D, S) :-
    DH is D + 1,                    % Add 1 to the depth
    SR is 0,                        % The new side is 0, looking for the right side of the branch
    print_tree_helper(RT, DH, SR),  % Recursive step, go to the right side, with the new depth, and the flag side to the right(0)
    spacing_helper(D),              % Print the spaces according to the depth
    print_root(R, S, D),            % Call the function to print the root with the prefixes
    SL is 1,                        % The new side is 1, looking for the left side of the branch
    print_tree_helper(LT, DH, SL).  % Recursive step, go to the left side, with the new depth, and the flag side to the left (1)

% Function to print the root with its prefixes
% The parameters are: (Root, SideForTheSlash, Depth)
print_root(R, S, D) :-
    (  D = 1                        % if depht is 1, means the main root of the tree
    -> write('--'), write(R), nl    % Print --
    );
    (  S = 0                        % if the side is right (0)
    -> write('/')                   % Print a /
    ;  write(\)                     % Otherwise print a \ 
    ), 
    write(-R),
    nl.

% For printing the spaces
% Base Case: the depth is 1
spacing_helper(1).
% Recursive Case: prints the spaces according with the given depth
% The parameter is: (Depth)
spacing_helper(D) :-
    D \= 1,             % Stop printing
    write('     '),     % Print the spaces
    DH is D - 1,        % Recursive step
    spacing_helper(DH). % Calling again the function


%%% Compute the height of the tree. Two parameters, the tree and the resulting height
% Base Case: the height of a nill is 0
tree_height(nil, 0).

% Recursive Case:
tree_height(node(_, LT, RT), H) :-
    tree_height(RT, HR),    % Calling again the function with other incognita to get the height of the right side of the branch
    tree_height(LT, HL),    % Calling again the function with other incognita to get the height of the left side of the branch
    (  HR > HL              % if the height of the right branch is higher than the left branch
    -> H is HR + 1          % Assigning the higher height accumulated in each level + 1, because is evaluating another level of the tree
    ;  H is HL + 1          
    ).


%%% Generate a list of all the elements at the leafs of the tree (nodes without children). Two parameters, the tree and the resulting list
% Base Cases: 
% where there are not roots left
list_leaves(nil, []).
% where there is a leaf, adds the root to the list
list_leaves(node(R, nil, nil), [R]).

% Recursive Case:
list_leaves(node(_, LT, RT), L) :-
    list_leaves(RT,L1), % Calling again the function with other incognita to get the list of the right side
    list_leaves(LT,L2), % Calling again the function with other incognita to get the list of the left side
    append(L2, L1, L).  % Appending the generated lists in each recusive case (subbranches) to the output list
    

%%% Determine if a tree has the same structure on its left and right branches, inverted. Only parameter is a tree
% Base Case: taking in consideration that a nil can be a symmetric tree
symmetric_tree(nil). 

% Recursive Case: 
symmetric_tree(node(_, LT, RT)) :- 
    mirror_tree(LT, RT). % Calling the mirror_tree function to determine if the subbranches are symmetric for each side of the branches


%%% Used to solve the previous predicate. Compare two trees to see if they have a mirrored structure. Two arguments, both trees
% Base Case: taking in consideration where the two given trees are nil, the trees are symmetric, otherwise the trees are not mirrors
mirror_tree(nil, nil).

% Recursive Case: 
mirror_tree(node(_, LT1, RT1), node(_, LT2, RT2)) :- 
    % Comparing the brances of the first tree are equal to the second tree.
    mirror_tree(LT1, RT2),  % If the left subbranch of the branch of firts tree are equal to the right subbranch of the branch of the second tree
    mirror_tree(RT1, LT2).  % If the right subbranch of the branch of the first tree are equal to the left subbranch of the the branch of the second tree
