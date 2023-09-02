% Sample tree structure
% node(Value, Cost, Children)
tree(node(a, 5, [node(b, 3, [node(d, 2, []), node(e, 4, [])]), node(c, 6, [])])).

% Best First Search algorithm
best_first_search(Tree, Goal, Path) :-
    bfs([Tree], Goal, [], Path).

% BFS helper predicate
bfs([node(Goal, _, Path) | _], Goal, RevPath, SolutionPath) :-
    reverse(Path, RevPath),
    SolutionPath = [Goal | RevPath].

bfs([node(X, _, Path) | Rest], Goal, RevPath, SolutionPath) :-
    expand(node(X, _, Path), Children),
    append(Children, Rest, NewFrontier),
    bfs(NewFrontier, Goal, RevPath, SolutionPath).

% Expand a node to its children
expand(node(_, _, Path), Children) :-
    findall(node(Child, Cost, [Child | Path]), child(Path, Child, Cost), Children).

% Define the child nodes and their costs here based on your problem.
% Example:
child([Parent | _], Child, Cost) :- % Define child nodes and their costs here.
    % For instance, if 'a' has children 'b' and 'c':
    (Parent = a, Child = b, Cost = 3);
    (Parent = a, Child = c, Cost = 6).

% Example usage:
% To find a path from 'a' to a goal node (e.g., 'd'):
% ?- tree(Tree), best_first_search(Tree, d, Path).
% Path will contain the solution path from 'a' to 'd'.
