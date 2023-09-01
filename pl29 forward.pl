% Define some facts about animals.
% is_a(Animal, Category)
is_a(cat, mammal).
is_a(dog, mammal).
is_a(dolphin, mammal).
is_a(tiger, mammal).
is_a(parrot, bird).
is_a(penguin, bird).
is_a(salmon, fish).
is_a(shark, fish).

% Define some rules for inferring additional facts.
% If an animal is a mammal, it is warm-blooded.
is_warm_blooded(Animal) :-
    is_a(Animal, mammal).

% If an animal is a bird, it can fly.
can_fly(Animal) :-
    is_a(Animal, bird).

% If an animal is a fish, it lives in water.
lives_in_water(Animal) :-
    is_a(Animal, fish).

% Implement forward chaining rules.
forward_chain :-
    write('Facts derived from forward chaining:'), nl,
    is_a(Animal, Category),
    assertz(is_warm_blooded(Animal)), % Assert new fact
    write(Animal), write(' is warm-blooded.'), nl,
    fail. % Continue forward chaining

forward_chain :-
    can_fly(Animal),
    assertz(can_fly(Animal)),
    write(Animal), write(' can fly.'), nl,
    fail.

forward_chain :-
    lives_in_water(Animal),
    assertz(lives_in_water(Animal)),
    write(Animal), write(' lives in water.'), nl,
    fail.

forward_chain.

% Example queries to trigger forward chaining.
% 1. Run forward chaining to infer warm-blooded, flying, and water-living animals.
% ?- forward_chain.

% 2. Query to check if a specific animal is warm-blooded, can fly, or lives in water.
% ?- is_warm_blooded(dog).
% ?- can_fly(parrot).
% ?- lives_in_water(salmon).
