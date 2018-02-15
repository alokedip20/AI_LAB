delete_middle_even(List,Result):-
	my_length(List,Length),
	Index1 is Length / 2,
	Index2 is Index1 - 1,
	my_delete(List,Index1,Temp),
	my_delete(Temp,Index2,Result).
