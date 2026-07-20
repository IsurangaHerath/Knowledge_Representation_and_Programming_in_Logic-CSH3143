write_action_list([]).
write_action_list([H|T]):-
    write_action(H),
    write_action_list(T), !.

can(S,S,_,[]).
can(S1,S2,V,[A|L]):-
    travel(S1,A,T),
    \+ member(T,V),
    can(T,S2,[T|V],L).

go:-
    initial_state(S),
    goal_state(G),
    can(S,G,[S],L),
    write_action_list(L), !.