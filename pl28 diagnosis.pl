% Define facts about medical conditions and their symptoms.
% condition(Name, [Symptom1, Symptom2, ...]).
condition(cold, [fever, cough, runny_nose]).
condition(flu, [fever, cough, body_aches, headache]).
condition(allergy, [sneezing, itchy_eyes, runny_nose]).

% Define rules for diagnosis based on symptoms.
diagnose(Condition, Symptoms) :-
    condition(Condition, ConditionSymptoms),
    subset(ConditionSymptoms, Symptoms).

% Define predicates for interacting with the user and making a diagnosis.
ask_symptoms(Symptoms) :-
    write('Please enter your symptoms separated by commas (e.g., fever, cough): '),
    read(Symptoms).

make_diagnosis :-
    ask_symptoms(UserSymptoms),
    findall(Condition, diagnose(Condition, UserSymptoms), PossibleConditions),
    (PossibleConditions = [] ->
        write('I cannot diagnose your condition with the provided symptoms.'),
        nl
    ;
        write('Possible conditions based on your symptoms: '),
        write(PossibleConditions),
        nl
    ).

% Start the program.
:- make_diagnosis.
