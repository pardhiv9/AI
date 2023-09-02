% Dietary recommendations for diseases
diet_recommendation(diabetes, [low_sugar, high_fiber, portion_control, regular_exercise]).
diet_recommendation(hypertension, [low_salt, low_fat, high_fruits_vegetables, regular_exercise]).
diet_recommendation(cholesterol, [low_saturated_fat, high_fiber, plant-based_proteins, regular_exercise]).
diet_recommendation(celiac_disease, [gluten_free, whole_grains, fruits_vegetables, lean_proteins]).

% Rules to suggest a diet based on a disease
suggest_diet(Disease, Diet) :-
    diet_recommendation(Disease, Diet).

% Query example:
% - To suggest a diet for diabetes:
%   ?- suggest_diet(diabetes, Diet).
%
%   Output: Diet = [low_sugar, high_fiber, portion_control, regular_exercise]
