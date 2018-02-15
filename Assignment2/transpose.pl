transpose(List1,List2,Result):-
	transpose_acc(List1,List2,[],Result).
transpose_acc([],[],A,A).
transpose_acc([Head1|Rest1],[Head2|Rest2],A,Result):-
	my_append([Head1],[Head2],P),
	my_append(A,[P],Temp),
	transpose_acc(Rest1,Rest2,Temp,Result).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
