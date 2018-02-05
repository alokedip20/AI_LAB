sum([],0).
sum([X|Rest],Result):-sum(Rest,Rest_result),Result is Rest_result + X.
