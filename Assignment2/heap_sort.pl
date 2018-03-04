heap_sort([],[]).
heap_sort([X],[X]).
heap_sort(List,Result):-
	construct_maxheap(List,Heap),
	heapsortacc(Heap,[],Result).

construct_maxheap([],nil).
construct_maxheap([Head|Rest],Heap):-
	partition(Rest,Left,Right),
	construct_maxheap(Left,Left_heap),
	construct_maxheap(Right,Right_heap),
	max_heapify(heap(Head,Left_heap,Right_heap),Heap).

heapsortacc(heap(nil,_,_), L, L).
heapsortacc(heap(Val, Leftheap,Rightheap), L, LSr):-
	 max_heapify(heap(nil, Leftheap,Rightheap), H),
	 heapsortacc(H, [Val | L], LSr).

partition([],[],[]).
partition([X],[X],[]).
partition([X|[Y|Rest]],[X|Rest1],[Y|Rest2]):-
	partition(Rest,Rest1,Rest2).

max_heapify(heap(Root,nil,heap(RVal,Left,Right)),heap(RVal,nil,Right_heap)):-
	greater(RVal,Root),
	max_heapify(heap(Root,Left,Right),Right_heap).

max_heapify(heap(Root,heap(LVal,Left,Right),nil),heap(LVal,Left_heap,nil)):-
        greater(LVal,Root),
        max_heapify(heap(Root,Left,Right),Left_heap).

max_heapify(heap(Root,heap(LVal,LL,LR),heap(RVal,RL,RR)),heap(LVal,Left_heap,heap(RVal,RL,RR))):-
	greater(LVal,Root),
	greater(LVal,RVal),
	max_heapify(heap(Root,LL,LR),Left_heap).

max_heapify(heap(Root,heap(LVal,LL,LR),heap(RVal,RL,RR)),heap(RVal,heap(LVal,LL,LR),Right_heap)):-
        greater(RVal,Root),
	greater(RVal,LVal),
        max_heapify(heap(Root,RL,RR),Right_heap).

max_heapify(Heap,Heap).

greater(nil,nil):-
	!,
	false.
greater(X,nil):-
	!
	.
greater(X,Y):-
	X > Y, 
	!;
	!, 
	false.
