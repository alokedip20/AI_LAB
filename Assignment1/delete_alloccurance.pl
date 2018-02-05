delete_all(_,[],[]).
delete_all(A,[A|L],B):-!,delete_all(A,L,B).
delete_all(A,[B|L],[B|M]):-delete_all(A,L,M).
