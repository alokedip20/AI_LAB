factorial(0,1).
factorial(X,N):-
	T is X - 1,
	factorial(T,N1),
	N is N1 * X.
