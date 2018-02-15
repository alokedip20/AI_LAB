inner_product(List1,List2,Result):-
	inner_product_acc(List1,List2,[],Result).
inner_product_acc([],[],A,A).
inner_product_acc([Head1|Rest1],[Head2|Rest2],A,Result):-
	T1 is Head1 * Head2,
	my_append(A,[T1],P),
	inner_product_acc(Rest1,Rest2,P,Result).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-	
	my_append(List1,List2,List3).	
