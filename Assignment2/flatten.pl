my_flatten([],[]).
my_flatten([Head|Rest], Flat_list) :-
    !,
    my_flatten(Head, Head_flat),
    my_flatten(Rest, Rest_flat),
    my_append(Head_flat, Rest_flat, Flat_list).
my_flatten(L, [L]).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
