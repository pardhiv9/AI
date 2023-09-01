% Sample directed graph represented as edges.
% edge(From, To, Cost).
edge(a, b, 2).
edge(a, c, 5).
edge(b, d, 7).
edge(b, e, 8).
edge(c, f, 3).
edge(d, g, 4).
edge(e, h, 6).
edge(f, i, 1).
edge(g, j, 9).
edge(h, k, 10).
edge(i, l, 11).
edge(j, m, 12).
edge(k, n, 13).
edge(l, o, 14).

% Heuristic function (estimated cost from a node to the goal).
% In this example, we use a simple heuristic function that assumes
% the cost to the goal is 0 for the goal node and 100 for all others.
heuristic(Node, 0) :- final_state(Node).
heuristic(_, 100).

% Define the goal state.
final_state(o).

% Implement Best-First Search using a priority queue.
% best_first_search(Start, Path).
best_first_search(Start, Path) :-
    best_first_search([[(Start, 0)]], Path).

best_first_search([[(Node, _)|Path]|_], [(Node, Cost)|Path]) :-
    final_state(Node),
    Cost < 100. % Ensures that the solution found is not infeasible.

best_first_search([Path|Paths], FinalPath) :-
    expand(Path, Children),
    append(Paths, Children, NewPaths),
    sort_paths(NewPaths, SortedPaths),
    best_first_search(SortedPaths, FinalPath).

% Expand a path by adding its child nodes.
expand([(Node, Cost)|Path], Children) :-
    findall(
        [(Child, NewCost), (Node, Cost)|Path],
        (edge(Node, Child, StepCost), heuristic(Child, H), NewCost is Cost + StepCost + H),
        Children
    ).

% Sort paths based on their cost (ascending order).
sort_paths(Paths, SortedPaths) :-
    predsort(compare_paths, Paths, SortedPaths).

compare_paths(Order, Path1, Path2) :-
    path_cost(Path1, Cost1),
    path_cost(Path2, Cost2),
    compare(Order, Cost1, Cost2).

path_cost([(Node, Cost)|_], Cost) :- final_state(Node).
path_cost([(_, _)|Path], Cost) :- path_cost(Path, Cost).

% Example query to find the shortest path from 'a' to 'o'.
% ?- best_first_search(a, Path).
