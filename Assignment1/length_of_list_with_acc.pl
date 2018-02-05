my_length(L,N):-length_acc(L,0,N).
length_acc([],A,A).
length_acc([H|T],A,N):-A1 is A + 1,length_acc(T,A1,N).
