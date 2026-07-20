% loops_and_decisions.pl
% ---------------------------------------------------------
% LOOPS (Using Recursion)
% ---------------------------------------------------------
% Terminating condition: Stop looping when the argument is 0.
testloop(0).

% Recursive condition: Loop from N, write N, subtract 1, and loop again.
testloop(N) :- 
    N > 0, 
    write('Number: '), write(N), nl, 
    M is N - 1, 
    testloop(M).

% ---------------------------------------------------------
% DECISION MAKING (If-Then-Else functionality)
% ---------------------------------------------------------
% Clause 1: If X is greater than Y.
gte(X,Y) :- X > Y, write('X is greater').

% Clause 2: Else if X and Y are the same.
gte(X,Y) :- X =:= Y, write('X and Y are same').

% Clause 3: Else if X is smaller than Y.
gte(X,Y) :- X < Y, write('X is smaller').