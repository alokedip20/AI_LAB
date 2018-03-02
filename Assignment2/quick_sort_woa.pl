quick_sort([],[]).
quick_sort([Pivot|Rest],Sorted_list):-
	partition(Rest,Left_half,Pivot,Right_half),
	quick_sort(Left_half,Left_sorted),
	append(Left_sorted,[Pivot],Left_final),
	quick_sort(Right_half,Right_sorted),
	append(Left_final,Right_sorted,Sorted_list).

partition([],[],_,[]).
partition([Head|Rest],[Head|Left_half],Pivot,Right_half):-
	Head =< Pivot,
		partition(Rest,Left_half,Pivot,Right_half).

partition([Head|Rest],Left_half,Pivot,[Head|Right_half]):-
        Head > Pivot,
                partition(Rest,Left_half,Pivot,Right_half).
