ack(0,N,R):-
	R is N + 1,!.
ack(M,0,R):-
	X is M - 1,
	ack(X,1,R).
ack(M,N,R):-
	R1 is M - 1,
	X is N - 1,
	ack(M,X,R2),
	ack(R1,R2,R).

