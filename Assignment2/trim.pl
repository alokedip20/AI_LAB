trim(N,[],[]).
trim(N,[Head|Rest],Rest):-
	N = 1.
trim(N,[Head|Rest],L1):-
	N > 1,
	N1 is N - 1,
	trim(N1,Rest,L1).
