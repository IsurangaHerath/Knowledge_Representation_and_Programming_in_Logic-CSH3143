% logic.pl
% ---------------------------------------------------------
% FACTS
% ---------------------------------------------------------
parent(jhon, bob).
parent(lili, bob).
male(jhon).
female(lili).

% ---------------------------------------------------------
% CONJUNCTION (Logical AND using ',')
% X is the father of Y if X is a parent AND X is male.
% ---------------------------------------------------------
father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).

% ---------------------------------------------------------
% DISJUNCTION (Logical OR using ';')
% X is a child of Y if Y is the father OR Y is the mother.
% ---------------------------------------------------------
child_of(X,Y) :- father(X,Y) ; mother(X,Y).