my_select(X,[X|R],R).
my_select(X,[Y|L],[Y|R]):-
	my_select(X,L,R).
permutation([],[]).
permutation(L,[H|R]):-
	my_select(H,L,T),
	permutation(T,R).

next_higher_permutation(List,Result):-
	permutation(List,Result),
	check_higher(List,Result),
	my_length(List,Length),
	factorial(Length,No),
	check_all_permutation(List,Result,No).

check_higher([Head1|Rest1],[Head2|Rest2]):-
	Head2 > Head1,
	!
	.
check_higher([Head|Rest1],[Head|Rest2]):-
	check_higher(Rest1,Rest2).

check_all_permutation(_,_,0).
check_all_permutation(List,X,No):-
	permutation(List,Temp),
	check_higher(List,Temp),
	not(check_higher(X,Temp)),!,
	N is No - 1,
	check_all_permutation(List,X,N).
