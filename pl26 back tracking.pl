% Define facts about fruits and their colors.
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).
fruit_color(kiwi, green).
fruit_color(lemon, yellow).

% Define a predicate to find the color of a fruit.
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Define a predicate to find the fruit with a specific color.
fruit_with_color(Color, Fruit) :-
    fruit_color(Fruit, Color).

% Example queries:
% 1. What is the color of an apple?
%    color_of_fruit(apple, Color).
%
% 2. What fruits are red?
%    fruit_with_color(red, Fruit).
%
% 3. Find all fruits and their colors.
%    fruit_color(Fruit, Color).

% Use the following query to find all fruits and their colors:
% ?- fruit_color(Fruit, Color).
