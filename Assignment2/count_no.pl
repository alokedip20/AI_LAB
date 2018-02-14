my_count(List,N):-
	count_acc(List,0,N).
count_acc([],A,A).
count_acc([Head|Rest],A,N):-
	N1 is A + 1,
	count_acc(Rest,N1,N).
