% Define symptoms of diseases
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, headache).
symptom(cold, runny_nose).
symptom(cold, sneezing).
symptom(cold, sore_throat).

% Rule to diagnose diseases based on symptoms
diagnose(Disease, Symptoms) :-
    setof(Disease, (member(Symptom, Symptoms), symptom(Disease, Symptom)), Diseases),
    length(Diseases, NumberOfDiseases),
    NumberOfDiseases > 0,
    NumberOfDiseases = 1,
    Diseases = [Disease].

% Example usage:
% To diagnose a patient's disease based on symptoms:
% ?- diagnose(Disease, [fever, headache, cough]).
% Disease will contain the diagnosis (e.g., flu).

% To list possible diseases based on symptoms:
% ?- diagnose(Disease, [fever, sneezing, sore_throat]).
% Disease will contain the diagnosis options (e.g., [cold, flu]).
