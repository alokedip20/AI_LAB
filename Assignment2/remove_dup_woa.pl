remove_dup([],[]).
remove_dup([Head|Rest],Result):-
	member_of(Head,Rest),
	remove_dup(Rest,Result).
remove_dup([Head|Rest],[Head|Result]):-
	remove_dup(Rest,Result).

member_of(X,[X|List]).
member_of(X,[Y|List]):-
	member_of(X,List).
	
