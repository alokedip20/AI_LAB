interleave([],List,List).
interleave(List,[],List).
interleave([Head1|Rest1],[Head2|Rest2],[Head1|[Head2|Result]]):-
	interleave(Rest1,Rest2,Result).
	
