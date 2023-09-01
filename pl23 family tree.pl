% Define facts about family relationships
% parent(Parent, Child) represents that Parent is the parent of Child.
parent(john, mary).
parent(john, lisa).
parent(susan, mary).
parent(susan, lisa).
parent(mary, ann).
parent(lisa, bob).
parent(lisa, sarah).
parent(bob, emma).
parent(sarah, liam).

% Define rules to infer other relationships
% Rule: X is the grandparent of Y if X is the parent of Z and Z is the parent of Y.
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Rule: X is the sibling of Y if they share a common parent (Z) and are not the same person.
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Rule: X is the aunt of Y if X is a sibling of Y's parent.
aunt(X, Y) :-
    sibling(X, Z),
    parent(Z, Y).

% Rule: X is the uncle of Y if X is a brother of Y's parent.
uncle(X, Y) :-
    sibling(X, Z),
    parent(Z, Y).

% Rule: X is the cousin of Y if their parents are siblings.
cousin(X, Y) :-
    parent(Z, X),
    parent(W, Y),
    sibling(Z, W).

% Rule: X is the ancestor of Y if X is a parent of Y or X is an ancestor of Z and Z is a parent of Y.
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
