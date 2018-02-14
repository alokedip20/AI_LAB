my_replace(X,[],Y,[]).
my_replace(X,[X|Rest],Y,[Y|Rest]):-!.
my_replace(X,[Z|Rest],Y,[Z|L1]):-
	my_replace(X,Rest,Y,L1).
