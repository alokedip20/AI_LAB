mean(L,Result):-
	sum(L,Sum),
	my_length(L,Length),
	Result is Sum / Length.
