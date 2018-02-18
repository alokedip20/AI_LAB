my_sub(X,0,X).
my_sub(X,Y,R):-
	T is X - 1,
	P is Y - 1,
	my_sub(T,P,R).
