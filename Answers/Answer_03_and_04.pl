% EXERCISE 3.1: Distance between two points[cite: 6]
distance((X1, Y1), (X2, Y2), D) :- 
    D is sqrt((X2 - X1)**2 + (Y2 - Y1)**2).

% EXERCISE 3.2: Print a square of characters[cite: 6]
square(N, Char) :- square_helper(N, N, Char).
square_helper(0, _, _) :- !.
square_helper(Rows, Cols, Char) :- 
    print_row(Cols, Char), nl, 
    NextRow is Rows - 1, 
    square_helper(NextRow, Cols, Char).

print_row(0, _) :- !.
print_row(N, Char) :- write(Char), Next is N - 1, print_row(Next, Char).

% EXERCISE 3.3 & 3.4: Fibonacci and Fast Fibonacci[cite: 6]
% The source of the "Out of local stack" error is redundant recursive calls 
% creating an exponential time complexity tree[cite: 6]. 
% Using an accumulator (tail recursion) fixes this.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, X) :- 
    N > 1, N1 is N - 1, N2 is N - 2, 
    fibonacci(N1, X1), fibonacci(N2, X2), X is X1 + X2.

fastfibo(N, X) :- fast_fibo_helper(N, 0, 1, X).
fast_fibo_helper(0, A, _, A).
fast_fibo_helper(N, A, B, X) :- 
    N > 0, N1 is N - 1, Sum is A + B, 
    fast_fibo_helper(N1, B, Sum, X).

% EXERCISE 3.5: Element at nth position[cite: 6]
element_at([H|_], 1, H).
element_at([_|T], N, X) :- N > 1, N1 is N - 1, element_at(T, N1, X).

% EXERCISE 3.6 & 3.7: List Math (Mean and Minimum)[cite: 6]
% For minimum/2, an empty list fails because it contains no values to compare[cite: 6].
mean(List, Mean) :- sum_list(List, Sum), length(List, Len), Len > 0, Mean is Sum / Len.

minimum([H|T], Min) :- min_helper(T, H, Min).
min_helper([], Min, Min).
min_helper([H|T], CurrMin, Min) :- H < CurrMin, min_helper(T, H, Min).
min_helper([H|T], CurrMin, Min) :- H >= CurrMin, min_helper(T, CurrMin, Min).

% EXERCISE 3.8: Generate range[cite: 6]
range(L, U, []) :- L > U.
range(L, U, [L|Rest]) :- L =< U, Next is L + 1, range(Next, U, Rest).

% EXERCISE 3.9 & 4.1: Date Database[cite: 6, 7]
% We get 28 solutions for older(X,Y) because it pairs every person with 
% every other strictly younger person combinations from the 8 facts[cite: 7].
born(jan, date(20,3,1977)).
born(jeroen, date(2,2,1992)).
born(joris, date(17,3,1995)).
born(jelle, date(1,1,2004)).
born(jesus, date(24,12,0)).
born(joop, date(30,4,1989)).
born(jannecke, date(17,3,1993)).
born(jaap, date(16,11,1995)).

year(Year, Person) :- born(Person, date(_, _, Year)).

before(date(_, _, Y1), date(_, _, Y2)) :- Y1 < Y2.
before(date(_, M1, Y), date(_, M2, Y)) :- M1 < M2.
before(date(D1, M, Y), date(D2, M, Y)) :- D1 < D2.

older(P1, P2) :- born(P1, D1), born(P2, D2), before(D1, D2).

% EXERCISE 3.10: Robot Status[cite: 6]
status(Commands, FinalPos, FinalOri) :- 
    execute(Commands, (0,0), north, FinalPos, FinalOri).

execute([], Pos, Ori, Pos, Ori).
execute([move|T], (X,Y), north, FinalPos, FinalOri) :- Y1 is Y + 1, execute(T, (X,Y1), north, FinalPos, FinalOri).
execute([move|T], (X,Y), east, FinalPos, FinalOri) :- X1 is X + 1, execute(T, (X1,Y), east, FinalPos, FinalOri).
execute([move|T], (X,Y), south, FinalPos, FinalOri) :- Y1 is Y - 1, execute(T, (X,Y1), south, FinalPos, FinalOri).
execute([move|T], (X,Y), west, FinalPos, FinalOri) :- X1 is X - 1, execute(T, (X1,Y), west, FinalPos, FinalOri).

execute([left|T], Pos, north, FinalPos, FinalOri) :- execute(T, Pos, west, FinalPos, FinalOri).
execute([left|T], Pos, west, FinalPos, FinalOri) :- execute(T, Pos, south, FinalPos, FinalOri).
execute([left|T], Pos, south, FinalPos, FinalOri) :- execute(T, Pos, east, FinalPos, FinalOri).
execute([left|T], Pos, east, FinalPos, FinalOri) :- execute(T, Pos, north, FinalPos, FinalOri).

execute([right|T], Pos, north, FinalPos, FinalOri) :- execute(T, Pos, east, FinalPos, FinalOri).
execute([right|T], Pos, east, FinalPos, FinalOri) :- execute(T, Pos, south, FinalPos, FinalOri).
execute([right|T], Pos, south, FinalPos, FinalOri) :- execute(T, Pos, west, FinalPos, FinalOri).
execute([right|T], Pos, west, FinalPos, FinalOri) :- execute(T, Pos, north, FinalPos, FinalOri).

% EXERCISE 3.11 & 4.2: Polynomial Sum[cite: 6, 7]
poly_sum([], P, P).
poly_sum([(C, E)|T], P2, Sum) :- 
    select((C2, E), P2, RestP2), !, 
    CNew is C + C2, 
    (CNew =:= 0 -> poly_sum(T, RestP2, Sum) ; poly_sum(T, RestP2, TempSum), Sum = [(CNew, E)|TempSum]).
poly_sum([(C, E)|T], P2, [(C, E)|Sum]) :- poly_sum(T, P2, Sum).

% EXERCISE 3.12, 3.13, 4.3, & 4.4: Primes and Goldbach Conjecture[cite: 6, 7]
prime(2).
prime(N) :- N > 2, N mod 2 =\= 0, \+ has_factor(N, 3).
has_factor(N, F) :- N mod F =:= 0.
has_factor(N, F) :- F * F < N, F2 is F + 2, has_factor(N, F2).

goldbach(N, A+B) :- 
    N > 2, N mod 2 =:= 0, Limit is N // 2, 
    between(2, Limit, A), prime(A), B is N - A, prime(B), !.