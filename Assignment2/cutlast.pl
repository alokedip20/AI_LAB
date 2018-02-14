cutlast(L,L1):-
	my_length(L,N),
	my_delete(L,N,L1).
my_length(L,N):-
	length_acc(L,0,N).
length_acc([],A,A).
length_acc([Head|Rest],A,N):-
	N1 is A + 1,
	length_acc(Rest,N1,N).
