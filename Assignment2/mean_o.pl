my_length([],0).
my_length([H|T],N):-my_length(T,N1), N is N1+1.
sum([],0).
sum([Head|Rest],N):-
	sum(Rest,N1),
	N is Head + N1.
mean(L,X):-
	sum(L,S),
	my_length(L,Length),
	X is S / Length.
