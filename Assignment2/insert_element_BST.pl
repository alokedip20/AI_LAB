insert(X,nil,bst(X,nil,nil)).
insert(X,bst(Root,Left,Right),bst(Root,Left1,Right)):-
	X =< Root,
		!,
		insert(X,Left,Left1).
insert(X,bst(Root,Left,Right),bst(Root,Left,Right1)):-
	X > Root,
		insert(X,Right,Right1).
