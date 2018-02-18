bubble_sort([],[]).
bubble_sort(List,Result):-
	swap_list(List,Swap_list),
	bubble_sort(Swap_list,Result).
bubble_sort(List,List).

swap_list([X,Y|Rest1],[Y,X|Rest1]):-	
	Y < X,
	!.
swap_list([X|Rest1],[X|Rest2]):-
	swap_list(Rest1,Rest2).
