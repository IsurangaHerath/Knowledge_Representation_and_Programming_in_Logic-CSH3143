% EXERCISE 6.1: Roman to Arabic Numerals[cite: 9]
symbol('I', 1).
symbol('V', 5).
symbol('X', 10).
symbol('L', 50).
symbol('C', 100).
symbol('D', 500).
symbol('M', 1000).

symbols2numbers([], []).
symbols2numbers([S1, S2|T], [V|Rest]) :- 
    symbol(S1, V1), symbol(S2, V2), V1 < V2, !, 
    V is V2 - V1, symbols2numbers(T, Rest).
symbols2numbers([S|T], [V|Rest]) :- 
    symbol(S, V), symbols2numbers(T, Rest).

sum([], 0).
sum([H|T], Sum) :- sum(T, Rest), Sum is H + Rest.

roman2arabic(Roman, Number) :- 
    atom_chars(Roman, Chars), symbols2numbers(Chars, Nums), sum(Nums, Number).

% EXERCISE 6.2: Countdown Letters Game[cite: 9]
word_letters(Word, Letters) :- atom_chars(Word, Letters).

cover(_, []).
cover(List, [H|T]) :- select(H, List, Rest), cover(Rest, T).

solution(Letters, Word, Score) :- 
    word(Word), word_letters(Word, WordChars), 
    length(WordChars, Score), cover(Letters, WordChars).

topsolution(Letters, Word, Score) :- 
    between(1, 9, N), Score is 10 - N, solution(Letters, Word, Score), !.