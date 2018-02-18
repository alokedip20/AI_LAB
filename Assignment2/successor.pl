arith(X,Y):-
	T is X + Y,
	P is X * Y,
	Q is X - Y,
	R is round(sqrt(X)),
	U is round(sqrt(Y)),	
	S is mod(X,Y),	
	abs(X,T1),
	abs(Y,T2),
	my_succ(T,R1),
	write('Sum ':R1),nl,
	my_succ(P,R2),
	write('Multiplication ':R2),nl,
	my_succ(Q,R3),
	write('Subtraction ':R3),nl,
	my_succ(T1,R5),
        write('Absolute of First argument ':R5),nl,
	my_succ(T2,R6),
        write('Absolute of 2nd argument ':R6),nl,
	my_succ(R,R7),
        write('Square root of first argument ':R7),nl,
	my_succ(U,R8),
        write('Square root of 2nd argument ':R8),nl,
	my_succ(S,R9),
        write('Reminder ':R9).

my_succ(0,0).
my_succ(N,s(M)):-
	N1 is N - 1,
	my_succ(N1,M).
