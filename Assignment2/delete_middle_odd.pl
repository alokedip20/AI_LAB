delete_middle(List,Result):-
	my_length(List,Length),
	Index is round(Length / 2),
	my_delete(List,Index,Result).

