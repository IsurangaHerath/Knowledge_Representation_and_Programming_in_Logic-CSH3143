% data_objects.pl
% ---------------------------------------------------------
% ATOMS AND CONSTANTS
% Atoms start with lower-case letters (e.g., jim, tom).
% ---------------------------------------------------------
hates(jim, tom).
hates(pat, bob).
hates(dog, fox).
hates(peter, tom).

% ---------------------------------------------------------
% ANONYMOUS VARIABLES
% Used to check IF someone hates 'tom' without caring WHO it is.
% ---------------------------------------------------------
% In the console, you would query: ?- hates(_, tom).
% The output would be: true ? ;