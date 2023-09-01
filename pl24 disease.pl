% Define the predicates for diet recommendations based on diseases.

% Example: Diet recommendation for diabetes.
diet_recommendation(diabetes, [fruits, vegetables, whole_grains, lean_protein, limit_sugar]).

% Example: Diet recommendation for high blood pressure.
diet_recommendation(high_blood_pressure, [low_sodium, potassium_rich_foods, whole_grains, lean_protein]).

% Example: Diet recommendation for heart disease.
diet_recommendation(heart_disease, [low_saturated_fat, high_fiber, omega_3_rich_foods, fruits, vegetables]).

% Define predicates to check if a person has a specific disease.
% You can implement these predicates based on specific disease criteria.
% For simplicity, we use user input.

has_disease(Person, Disease) :-
    write('Does '), write(Person), write(' have '), write(Disease), write('? (yes/no): '),
    read(Response),
    Response = yes.

% Define a predicate to suggest a diet based on a person's disease.
suggest_diet(Person, RecommendedDiet) :-
    has_disease(Person, Disease),
    diet_recommendation(Disease, RecommendedDiet).

% Example queries:
% Interactive input and output.
main :-
    write('Enter the person\'s name: '),
    read(Person),
    suggest_diet(Person, RecommendedDiet),
    write('Recommended diet for '), write(Person), write(': '), write(RecommendedDiet), nl.

% Run the program.
:- main.
