% Define students and their courses
student(john, cs101).
student(lisa, math201).
student(mary, cs101).
student(david, physics101).
student(anna, math201).

% Define teachers and the courses they teach
teacher(prof_smith, cs101).
teacher(prof_jones, math201).
teacher(prof_doe, physics101).

% Define subjects and their course codes
subject(math, math201).
subject(computer_science, cs101).
subject(physics, physics101).

% Define a rule to find the subjects a student is studying
studying_subject(Student, Subject) :-
    student(Student, CourseCode),
    subject(Subject, CourseCode).

% Define a rule to find the teacher of a course
course_teacher(CourseCode, Teacher) :-
    teacher(Teacher, CourseCode).
