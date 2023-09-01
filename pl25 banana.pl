% Define the initial state of the room.
% state(MonkeyX, MonkeyY, BoxX, BoxY, HasBanana)
% MonkeyX and MonkeyY represent the monkey's position.
% BoxX and BoxY represent the box's position.
% HasBanana is true if the monkey has the banana.

initial_state(state(1, 1, 2, 1, no)).

% Define the final state where the monkey has the banana.
final_state(state(_, _, _, _, yes)).

% Define the possible actions to move the monkey, the box, or take the banana.
% move(MoveName, CurrentState, NewState)

% Monkey moves left
move(left, state(X1, Y, X2, Y, Banana), state(X1n, Y, X2n, Y, Banana)) :-
    X1 > 1,
    X1n is X1 - 1,
    X2n is X2 - 1.

% Monkey moves right
move(right, state(X1, Y, X2, Y, Banana), state(X1n, Y, X2n, Y, Banana)) :-
    X1 < 4,
    X1n is X1 + 1,
    X2n is X2 + 1.

% Monkey moves up
move(up, state(X, Y1, X, Y2, Banana), state(X, Y1n, X, Y2n, Banana)) :-
    Y1 > 1,
    Y1n is Y1 - 1,
    Y2n is Y2 - 1.

% Monkey moves down
move(down, state(X, Y1, X, Y2, Banana), state(X, Y1n, X, Y2n, Banana)) :-
    Y2 < 4,
    Y1n is Y1 + 1,
    Y2n is Y2 + 1.

% Monkey pushes the box left
move(push_left, state(X1, Y, X2, Y, Banana), state(X1n, Y, X2n, Y, Banana)) :-
    X1 > 1,
    X1n is X1 - 1,
    X2n is X2 - 1.

% Monkey pushes the box right
move(push_right, state(X1, Y, X2, Y, Banana), state(X1n, Y, X2n, Y, Banana)) :-
    X2 < 4,
    X1n is X1 + 1,
    X2n is X2 + 1.

% Monkey pushes the box up
move(push_up, state(X, Y1, X, Y2, Banana), state(X, Y1n, X, Y2n, Banana)) :-
    Y1 > 1,
    Y1n is Y1 - 1,
    Y2n is Y2 - 1.

% Monkey pushes the box down
move(push_down, state(X, Y1, X, Y2, Banana), state(X, Y1n, X, Y2n, Banana)) :-
    Y2 < 4,
    Y1n is Y1 + 1,
    Y2n is Y2 + 1.

% Monkey takes the banana
move(take, state(X, Y, X, Y, no), state(X, Y, X, Y, yes)).

% Define a predicate to check if a state is valid.
valid_state(state(_, _, _, _, no)).

% Define a predicate to find a sequence of actions to reach the final state.
% solve(State, Actions)
solve(State, Actions) :- solve(State, [], Actions).
solve(State, _, []) :- final_state(State), valid_state(State).
solve(State, Visited, [Action | Rest]) :-
    move(Action, State, NextState),
    \+ member(NextState, Visited),
    solve(NextState, [NextState | Visited], Rest).

% Define a predicate to display the sequence of actions.
display_actions([]).
display_actions([Action | Rest]) :-
    write(Action), nl,
    display_actions(Rest).

% Main predicate to solve and display the Monkey and Banana problem.
main :-
    initial_state(InitialState),
    solve(InitialState, Actions),
    write('Solution Steps:'), nl,
    display_actions(Actions).

% Run the program.
:- main.
