my_length([],0).
my_length([X|Rest],s(M)):- my_length(Rest,M).
