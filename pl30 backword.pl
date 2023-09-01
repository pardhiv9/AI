% Define some rules and facts.
% If an animal is warm-blooded, it is a mammal.
is_warm_blooded(X) :- is_mammal(X).

% If an animal can fly, it is a bird.
can_fly(X) :- is_bird(X).

% If an animal lives in water, it is a fish.
lives_in_water(X) :- is_fish(X).

% Define facts about specific animals.
is_mammal(cat).
is_mammal(dog).
is_mammal(dolphin).
is_mammal(tiger).

is_bird(parrot).
is_bird(penguin).

is_fish(salmon).
is_fish(shark).

% Define a goal to be achieved.
goal(X) :- is_warm_blooded(X).

% Define a predicate to check if an animal meets the goal.
animal_meets_goal(X) :- goal(X), write(X), write(' meets the goal.'), nl.

% Example queries to trigger backward chaining.
% 1. Check if a specific animal (e.g., cat) meets the goal of being warm-blooded.
% ?- animal_meets_goal(cat).

% 2. Find all animals that meet the goal of being warm-blooded.
% ?- findall(X, animal_meets_goal(X), Animals).
