permutation([],[]).
permutation(L,[H|R]):-
	my_select(H,L,T),
	permutation(T,R).
permutation_sort([],[]).
permutation_sort(L,L1):-
	permutation(L,L1),
	ordered(L1),!.
