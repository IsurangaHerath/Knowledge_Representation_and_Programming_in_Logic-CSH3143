% state(monkey-horizontal, monkey-vertical, box-location, has / hasnot banana)

initial_state(state(door,onfloor,window,hasnot)).
goal_state(   state(middle,onbox,middle,has)).

% ---------------- Moves ----------------

move(state(middle,onbox,middle,hasnot),
     grasp,
     state(middle,onbox,middle,has)).

move(state(P,onfloor,P,Has),
     climb,
     state(P,onbox,P,Has)).

move(state(P,onfloor,P,Has),
     push(P,P1),
     state(P1,onfloor,P1,Has)).

move(state(P1,onfloor,B,Has),
     walk(P1,P2),
     state(P2,onfloor,B,Has)).

% ---------------- Printing actions ----------------

writeAction(climb) :-
    write('Monkey climbs the box'), nl.

writeAction(grasp) :-
    write('Monkey grasps the banana'), nl.

writeAction(walk(A,B)) :-
    format('Monkey walks from ~w to ~w~n',[A,B]).

writeAction(push(A,B)) :-
    format('Monkey pushes the box from ~w to ~w~n',[A,B]).

writeActionList([]).
writeActionList([H|T]) :-
    writeAction(H),
    writeActionList(T).

% ---------------- Search for a plan ----------------

canGet(S,S,[]).
canGet(S1,S2,[H|T]) :-
    move(S1,H,S),
    canGet(S,S2,T).

go :-
    initial_state(S),
    goal_state(G),
    canGet(S,G,L),
    writeActionList(L).
