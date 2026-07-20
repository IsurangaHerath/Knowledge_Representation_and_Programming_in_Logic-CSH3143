% relations.pl
% ---------------------------------------------------------
% FACTS: Defining basic parent and gender relationships.
% ---------------------------------------------------------
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, peter).
parent(peter, jim).

female(pam).
female(liz).
female(ann).

male(tom).
male(bob).
male(peter).
male(jim).

% ---------------------------------------------------------
% RULES: Defining complex relationships using logic.
% ---------------------------------------------------------
% Mother relationship: X is the mother of Y if X is a parent of Y and X is female.
mother(X,Y) :- parent(X,Y), female(X).

% Father relationship: X is the father of Y if X is a parent of Y and X is male.
father(X,Y) :- parent(X,Y), male(X).

% Sister relationship: X and Y are sisters if they share a parent, X is female, and X is not Y.
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), X \== Y.

% ---------------------------------------------------------
% RECURSION: Defining a predecessor (ancestor) relationship.
% ---------------------------------------------------------
% Base case: X is a predecessor of Z if X is an immediate parent of Z.
predecessor(X, Z) :- parent(X, Z).

% Recursive step: X is a predecessor of Z if X is a parent of Y, and Y is a predecessor of Z.
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).