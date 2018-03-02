selection_sort([],[]).
selection_sort([X],[X]).
selection_sort(List,[Head|Sorted_list]):-
	find_minimum(List,Head),
	my_select(List,Head,Rest),
	selection_sort(Rest,Sorted_list).

find_minimum([Head|List],Result):-
	minimum_acc(List,Head,Result).
minimum_acc([],A,A).
minimum_acc([Head|Rest],A,Result):-
	Head < A,
		minimum_acc(Rest,Head,Result).
minimum_acc([Head|Rest],A,Result):-
        Head >= A,
                minimum_acc(Rest,A,Result).

my_select([],_,[]).
my_select([X|Rest],X,Rest).
my_select([X|Rest],Y,[X|Result]):-
	my_select(Rest,Y,Result).

