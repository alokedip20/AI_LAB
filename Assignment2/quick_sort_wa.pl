quick_sort(List,Sorted_list):-
	quick_sort_acc(List,[],Sorted_list).
quick_sort_acc([],A,A).
quick_sort_acc([Pivot|Rest],A,Sorted_list):-
	partition(Rest,Left_half,Pivot,Right_half),
	quick_sort_acc(Left_half,A,Left_sorted),
	append(Left_sorted,[Pivot],Left_final),
	quick_sort_acc(Right_half,Left_final,Sorted_list).
partition([],[],_,[]).
partition([Head|Rest],[Head|Left_half],Pivot,Right_half):-
	Head =< Pivot,
		partition(Rest,Left_half,Pivot,Right_half).
partition([Head|Rest],Left_half,Pivot,[Head|Right_half]):-
	Head > Pivot,
		partition(Rest,Left_half,Pivot,Right_half).
