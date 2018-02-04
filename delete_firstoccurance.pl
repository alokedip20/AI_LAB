delete_occur(_,[],[]).
delete_occur(A,[A|L],L):-!.
delete_occur(A,[B|L],[B|M]):-delete_occur(A,L,M).
