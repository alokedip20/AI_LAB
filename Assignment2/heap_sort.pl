heap_sort(L, LSr):-
	buildheap(L, H),
	heapsortacc(H, [], LSr).

buildheap([], nil).
buildheap([X | Rest], H):-
	partition(Rest, L, R),
	buildheap(L, Leftheap),
	buildheap(R, Rightheap),
	heapify(heap(Leftheap, X, Rightheap), H).

partition([], [], []).
partition([X], [X], []). 
partition([X|[Y|Rest]], [X|L], [Y|R]):-
	partition(Rest, L,R).


heapsortacc(heap(_,nil,_), L, L).
heapsortacc(heap(Leftheap, Val, Rightheap), L, LSr):-
	 heapify(heap(Leftheap, nil, Rightheap), H),
	 heapsortacc(H, [Val | L], LSr).
	 
	 
large(nil,nil):- 
	!, 
	false.
large(X, nil):- 
	!
	.
large(X,Y):- 
	X > Y, 
	!;
	!, 
	false.
	
heapify(heap(nil, Val, heap(RL, RVal, RR)), heap(nil, RVal, Rightheap)):-
	large(RVal, Val), !,
	heapify(heap(RL, Val, RR), Rightheap).

heapify(heap(heap(LL, LVal, LR), Val, nil), heap(Leftheap, LVal, nil)):-
	large(LVal, Val), !,
	heapify(heap(LL, Val, LR), Leftheap).

heapify(heap(heap(LL, LVal,LR), Val, heap(RL, RVal, RR)), heap(Leftheap, LVal, heap(RL, RVal, RR))):-
	large(LVal, Val),
	large(LVal, RVal), !,
	heapify(heap(LL, Val, LR), Leftheap).
heapify(heap(heap(LL, LVal,LR), Val, heap(RL, RVal, RR)), heap(heap(LL, LVal, LR), RVal, Rightheap)):-
	large(RVal, Val),
	large(RVal, LVal), !,
	heapify(heap(RL, Val, RR), Rightheap).
heapify(H, H).
