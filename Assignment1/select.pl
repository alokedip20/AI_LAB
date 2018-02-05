my_select(X,[X|R],R).
my_select(X,[Y|L],[Y|R]):-
	my_select(X,L,R).
