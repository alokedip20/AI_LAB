my_length([],0).
my_length([H|T],N):-my_length(T,N1), N is N1+1.
