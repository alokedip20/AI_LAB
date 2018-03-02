nhp(List,Result):-
	digit(List,Initial),
	nb_setval(diff,99999999),
	nb_setval(no,-1),
	not(nhp_acc(List,Initial,A,Result)),
	nb_getval(no,X),
	write("Digit ":X),
	convert_list(X,Result).

nhp_acc(List,Initial,A,Result):-
	permutation(List,Temp),
	digit(Temp,X),
	T is X - Initial,
	nb_getval(diff,Diff),
	T > 0,
		T < Diff,
			nb_setval(diff,T),
			nb_setval(no,X),
			fail.
	


digit(List,R):-
	my_length(List,Length),
	digit_acc(List,Length,0,R),
	!
	.
digit_acc(List,0,A,A).	
digit_acc([Head|Rest],Length,A,R):-
	T is Length - 1,	
	power(10,T,X),
	M is Head * X,
	Temp is A + M,
	N is Length - 1,
	digit_acc(Rest,N,Temp,R).
	

power(X,Y,R):-
	power_acc(X,Y,1,R).
power_acc(X,0,A,A).
power_acc(X,Y,A,R):-
	T is A * X,
	P is Y - 1,
	power_acc(X,P,T,R).

convert_list(Digit,Result):-
	list_acc(Digit,[],Result).

list_acc(0,A,A).
list_acc(Digit,A,Result):-
	X is mod(Digit,10),
	T is div(Digit,10),
	list_acc(T,[X|A],Result).
	
