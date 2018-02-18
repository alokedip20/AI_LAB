arith(_,0):-
	write("Can not divide by zero"),
	!
	.
arith(X,Y):-
	T is X + Y,
	P is X - Y,
	Q is X * Y,
	R is X / Y,
	write('Sum is ':T),nl,
	write('Substraction is ':P),nl,
	write('Multiplication is ':Q),nl,
	write('Division is ':R).
