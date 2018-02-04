merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,S):-
	divide(L,L1,L2),
	merge_sort(L1,L1s),
	merge_sort(L2,L2s),
	merge(L1s,L2s,S).
divide([],[],[]).
divide([X],[X],[]).
divide([X|[Y|L]],[X|L1],[Y|L2]):-
	divide(L,L1,L2).
merge(L1,[],L1).
merge([],L2,L2).
merge([X|L1],[Y|L2],[X|L]):-
	X < Y,!,
	merge(L1,[Y|L2],L).
merge([X|L1],[Y|L2],[Y|L]):-
	X > Y,!,
	merge([X|L1],L2,L).
merge([X|L1],[Y|L2],[X|[Y|L]]):-
	merge(L1,L2,L).
