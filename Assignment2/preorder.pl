preorder(nil,[]).
preorder(tree(X,Left,Right),[X|Traversal]):-
	preorder(Left,Left_t),
	preorder(Right,Right_t),
	my_append(Left_t,Right_t,Traversal).

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
