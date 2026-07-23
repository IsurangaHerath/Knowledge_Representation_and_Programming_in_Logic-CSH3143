% state(MissionariesLeft, CannibalsLeft, BoatSide) where 1 is Left, 0 is Right[cite: 11]
initial_state(state(3, 3, 1)).
goal_state(state(0, 0, 0)).

% Operators: Send 1 or 2 people across[cite: 11]
move(state(M1, C1, 1), state(M2, C2, 0)) :- 
    between(0, 2, M), between(0, 2, C), M + C > 0, M + C =< 2,
    M2 is M1 - M, C2 is C1 - C, M2 >= 0, C2 >= 0.
move(state(M1, C1, 0), state(M2, C2, 1)) :- 
    between(0, 2, M), between(0, 2, C), M + C > 0, M + C =< 2,
    M2 is M1 + M, C2 is C1 + C, M2 =< 3, C2 =< 3.

% Constraint: Missionaries must never be outnumbered by cannibals on either side[cite: 11]
safe(state(M, C, _)) :- 
    (M >= C ; M =:= 0), 
    MRight is 3 - M, CRight is 3 - C, 
    (MRight >= CRight ; MRight =:= 0).

% Breadth First Search Logic[cite: 11]
solve_mc :- 
    initial_state(I), bfs([[I]], Path), reverse(Path, OrderedPath), print_path(OrderedPath).

bfs([[state(0,0,0)|Path]|_], [state(0,0,0)|Path]).
bfs([Path|Paths], Solution) :- 
    Path = [State|_],
    findall([NextState|Path], (move(State, NextState), safe(NextState), \+ member(NextState, Path)), NextPaths),
    append(Paths, NextPaths, NewPaths),
    bfs(NewPaths, Solution).

print_path([]).
print_path([H|T]) :- write(H), nl, print_path(T).