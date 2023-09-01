% Define facts about birds and whether they can fly
can_fly(pigeon).
can_fly(sparrow).
can_fly(eagle).
can_fly(owl).
can_fly(bat).

% Define birds that cannot fly
cannot_fly(penguin).
cannot_fly(ostrich).
cannot_fly(kiwi).

% Define a rule to check if a bird can fly
can_bird_fly(Bird) :-
    can_fly(Bird),
    write(Bird),
    write(' can fly.'),
    nl.

% Define a rule to check if a bird cannot fly
cannot_bird_fly(Bird) :-
    cannot_fly(Bird),
    write(Bird),
    write(' cannot fly.'),
    nl.
