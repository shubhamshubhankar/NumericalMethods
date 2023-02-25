% Main file to call all the functions and read the specific inputs.
fileName = 'GEM_input.txt';

[A, B] = read_input(fileName);

%X = backward_substitution(A, B);
%X = forward_substitution(A, B);
%disp(X);


% Name of the file for GEM input

fileName = 'GEM_input.txt';

[A, B] = read_input(fileName);

[A, B] = GEM(A, B);

X = backward_substitution(A, B);

disp(X);






