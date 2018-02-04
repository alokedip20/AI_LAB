selection_sort([],[]).
selection_sort(L,[H|T]):-
	least(H,L,R),
	selection_sort(R,T).
least(H,L,R):-
	my_select(H,L,R),
	smaller(H,R).
smaller(_,[]).
smaller(X,[H|T]):-
	X =< H,
	smaller(X,T).
