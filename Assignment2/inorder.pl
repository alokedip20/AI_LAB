inorder(nil,[]).
inorder(bst(X,Left,Right),Traversal):-
	inorder(Left,Left_t),
	my_append(Left_t,[X],Temp),
	inorder(Right,Right_t),
	my_append(Temp,Right_t,Traversal).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
        my_append(List1,List2,List3).
