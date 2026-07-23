% EXERCISE 7.1: The 4-Color Problem Map[cite: 10]
color(red). 
color(blue). 
color(yellow). 
color(green).

% Maps to regions A, B, C, D, E based on the map graphic adjacencies[cite: 10]
admissible(A, B, C, D, E) :-
    color(A), color(B), color(C), color(D), color(E),
    A \= B, A \= C, A \= D, A \= E, % A borders everything
    B \= C, B \= E,                 % B borders C, E, A
    C \= D, C \= E,                 % C borders B, D, E, A
    D \= E.                         % D borders C, E, A

% EXERCISE 7.2: Monkey and Banana Problem[cite: 10]
move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has), [grasp]).
move(state(P, onfloor, P, H), climb, state(P, onbox, P, H), [climb]).
move(state(P1, onfloor, P1, H), push(P1, P2), state(P2, onfloor, P2, H), [push(P1,P2)]).
move(state(P1, onfloor, B, H), walk(P1, P2), state(P2, onfloor, B, H), [walk(P1,P2)]).

canget(state(_, _, _, has), []).
canget(State1, Sequence) :-
    move(State1, _, State2, Action),
    canget(State2, SubGoal),
    append(Action, SubGoal, Sequence).