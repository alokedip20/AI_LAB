linearize(nil,[]).
linearize(bst(Root,Left,Right),List):-
	linearize(Left,L1),
	linearize(Right,R1),
	my_append(L1,[Root|R1],List).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
