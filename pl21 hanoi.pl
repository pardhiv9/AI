% Define the Hanoi predicate
hanoi(N) :-
    move(N, 'A', 'C', 'B').

% Base case: Move one disk from source to destination
move(1, Source, Destination, _) :-
    write('Move disk 1 from '),
    write(Source),
    write(' to '),
    write(Destination),
    nl.

% Recursive case: Move N-1 disks from source to auxiliary peg, then move the Nth disk from source to destination, and finally move the N-1 disks from auxiliary to destination peg
move(N, Source, Destination, Auxiliary) :-
    N > 1,
    M is N - 1,
    move(M, Source, Auxiliary, Destination),
    write('Move disk '),
    write(N),
    write(' from '),
    write(Source),
    write(' to '),
    write(Destination),
    nl,
    move(M, Auxiliary, Destination, Source).

% Example usage:
% To solve the Towers of Hanoi problem for 3 disks:
% ?- hanoi(3).
