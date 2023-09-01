% Facts
born(jan, 20, 3, 1977).
born(jeroen, 2, 2, 1992).
born(joris, 17, 3, 1995).
born(jelle, 1, 1, 2004).
born(jesus, 24, 12, 2000).
born(joop, 30, 4, 1989).
born(jannecke, 17, 3, 1993).
born(jaap, 16, 11, 1995).

% Rules

% Calculate the age of a person based on their birthdate
age(Person, Age) :-
    born(Person, _, _, BirthYear),
    current_year(CurrentYear),
    Age is CurrentYear - BirthYear.

% Define the current year (for simplicity)
current_year(2023).

% Find people born in a specific year
born_in_year(Person, Year) :-
    born(Person, _, _, Year).

% Find people older than a certain age
older_than(Person, Age) :-
    age(Person, PersonAge),
    PersonAge > Age.
