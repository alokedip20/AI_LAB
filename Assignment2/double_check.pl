double_check(L1,L2):-	
	my_length(L1,N1),
	my_length(L2,N2),
	N2 is 2 * N1,
		main(L1,L2).
main([],_).
main([Head|Rest],L1):-
	check_occur(Head,L1,X),
	X = 2,
		main(Rest,L1).

check_occur(X,L,N):-
	occur_acc(X,L,0,N).
occur_acc(X,[],A,A).
occur_acc(X,[Head|Rest],A,N):-
	X = Head,
		N1 is A + 1,
		occur_acc(X,Rest,N1,N).
occur_acc(X,[Head|Rest],A,N):-
        X =\= Head,
        	occur_acc(X,Rest,A,N).
	
	
my_length(L,N):-
	length_acc(L,0,N).
length_acc([],A,A).
length_acc([Head|Rest],A,N):-
	N1 is A + 1,
		length_acc(Rest,N1,N).
