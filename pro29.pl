% Define rules
rule(has_fur) :- animal(mammal).
rule(has_feathers) :- animal(bird).
rule(has_scales) :- animal(reptile).
rule(flies) :- has_feathers, lays_eggs.
rule(gives_milk) :- has_fur, gives_birth.

% Define initial facts
animal(mammal).
animal(bird).
animal(reptile).
has_feathers.
lays_eggs.

% Forward chaining algorithm
forward_chaining :-
    repeat,
    (   (new_fact(Fact), \+ already_known(Fact))
    ->  asserta(already_known(Fact)), write('Derived: '), write(Fact), nl, fail
    ;   !, nl, write('No new facts can be derived.'), nl
    ).

% Helper predicates
new_fact(Fact) :-
    rule(Fact),
    \+ already_known(Fact).

already_known(Fact) :-
    (   Fact
    ;   \+ Fact
    ).

% Example queries:
% To start forward chaining:
% ?- forward_chaining.

% To check if a fact is already known:
% ?- already_known(has_fur).
% ?- already_known(flies).
