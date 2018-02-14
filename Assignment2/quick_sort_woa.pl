quick_sort([],[]).
quick_sort([Pivot|Rest],Result):-
	partition(Rest,Pivot,Left,Right),
	quick_sort(Left,Left_sort),
	quick_sort(Right,Right_sort),
	my_append(Left_sort,[Pivot|Right_sort],Result).

partition([],Pivot,[],[]).
partition([Head1|L1],Pivot,[Head1|Left_sort],Right_sort):-
	Head1 =< Pivot,
		partition(L1,Pivot,Left_sort,Right_sort).

partition([Head1|L1],Pivot,Left_sort,[Head1|Right_sort]):-
        Head1 > Pivot,
                partition(L1,Pivot,Left_sort,Right_sort).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
