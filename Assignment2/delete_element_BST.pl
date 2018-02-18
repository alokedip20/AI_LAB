delete_BST(X,nil,nil):-
	write('Element is not found'),nl.
delete_BST(X,bst(X,nil,Right),Right):-
	!
	.
delete_BST(X,bst(X,Left,nil),Left):-
	!
	.
delete_BST(X,bst(X,Left,Right),bst(Pred,New_left,Right)):-
	get_pred(Left,Pred,New_left),
	!
	.
delete_BST(X,bst(Root,Left,Right),bst(Root,New_left,Right)):-
	X < Root,
		delete_BST(X,Left,New_left),
		!
		.
delete_BST(X,bst(Root,Left,Right),bst(Root,Left,New_right)):-
	delete_BST(X,Right,New_right).


get_pred(bst(X,Left,nil),X,Left):-
	!
	.
get_pred(bst(X,Left,Right),Pred,bst(X,Left,New_right)):-
	get_pred(Right,Pred,New_right).
