check_circle([X|List]):-
	continous([X|List]),
	my_last(List,Last),
	check(Last,X).

my_last([X],X).
my_last([Head|Tail],R):-
	my_last(Tail,R).
