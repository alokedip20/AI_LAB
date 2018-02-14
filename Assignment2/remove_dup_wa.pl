remove_dup(L,Result):-
	remove_dup_acc(L,[],Result).
remove_dup_acc([],A,A).
remove_dup_acc([Head|Rest],A,Result):-
	member_of(Head,A),
	remove_dup_acc(Rest,A,Result).
remove_dup_acc([Head|Rest],A,Result):-
	my_append(A,[Head],B),
        remove_dup_acc(Rest,B,Result).

member_of(X,[X|List]).
member_of(X,[Y|List]):-
	member_of(X,List).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
