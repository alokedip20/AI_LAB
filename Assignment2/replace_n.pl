my_replace([],X,N,[]).
my_replace([Head|Rest],X,N,[X|Rest]):-
	N = 1.
my_replace([Head|Rest],X,N,[Head|L1]):-
	N > 1,
	N1 is N - 1,
	my_replace(Rest,X,N1,L1).

