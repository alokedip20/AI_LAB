my_reverse([],[]).
my_reverse([Head|Rest],Result):-
	my_reverse(Rest,Rest_rev),
	my_append(Rest_rev,[Head],Result).

my_append([],X,X).
my_append([Head1|Rest1],List2,[Head1|List3]):-
	my_append(Rest1,List2,List3).
	
