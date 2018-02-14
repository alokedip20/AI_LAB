trim_last(N,L,L1):-
	my_reverse(L,L_rev),
	trim(N,L_rev,L1_rev),
	my_reverse(L1_rev,L1).

my_reverse([],[]).
my_reverse([Head|Rest],Z):-
	my_reverse(Rest,L1),
	my_append(L1,[Head],Z).

my_append([],List,List).
my_append([X|List1],List2,[X|List3]):-my_append(List1,List2,List3).
