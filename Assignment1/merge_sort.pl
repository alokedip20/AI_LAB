merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(List,Sorted_list):-
	divide(List,Left_half,Right_half),
	merge_sort(Left_half,Left_sorted),
	merge_sort(Right_half,Right_sorted),
	merge(Left_sorted,Right_sorted,Sorted_list),
	!
	.

divide([],[],[]).
divide([X],[X],[]).
divide([First_element|[Second_element|Rest]],[First_element|Left_half],[Second_element|Right_half]):-
	divide(Rest,Left_half,Right_half).

merge([],Right_list,Right_list).
merge(Left_list,[],Left_list).
merge([Head_left|Left_list],[Head_right|Right_List],[Head_left|Rest_merged]):-
	Head_left < Head_right,
		merge(Left_list,[Head_right|Right_List],Rest_merged).

merge([Head_left|Left_list],[Head_right|Right_List],[Head_right|Rest_merged]):-
        Head_left >= Head_right,
                merge([Head_left|Left_list],Right_List,Rest_merged).

