% Define facts about planets
planet(mercury, rocky, 0.39, 0.24, 88).
planet(venus, rocky, 0.72, 0.62, 225).
planet(earth, rocky, 1.00, 1.00, 365).
planet(mars, rocky, 1.52, 0.11, 687).
planet(jupiter, gas_giant, 5.20, 317.8, 4333).
planet(saturn, gas_giant, 9.58, 95.2, 10759).
planet(uranus, ice_giant, 19.22, 14.6, 30689).
planet(neptune, ice_giant, 30.05, 17.2, 60182).

% Define rules for classifying planets based on their attributes
rocky_planet(Planet) :-
    planet(Planet, rocky, _, _, _).

gas_giant(Planet) :-
    planet(Planet, gas_giant, _, _, _).

ice_giant(Planet) :-
    planet(Planet, ice_giant, _, _, _).

% Calculate the average distance from the Sun for a planet
average_distance(Planet, Distance) :-
    planet(Planet, _, Distance, _, _).

% Calculate the mass of a planet in Earth masses
planet_mass(Planet, Mass) :-
    planet(Planet, _, _, Mass, _).

% Calculate the length of a planet's year in Earth days
year_length(Planet, Days) :-
    planet(Planet, _, _, _, Days).
