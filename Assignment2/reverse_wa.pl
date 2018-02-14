my_reverse(L,R):-
	reverse_acc(L,[],R).
reverse_acc([],A,A).
reverse_acc([Head|Rest],A,R):-
	my_append_front(Head,A,B),
	reverse_acc(Rest,B,R).
my_append_front(X,List,[X|List]).
