check(arc(X1,Y1),arc(X2,Y2)):-
	Y1 = X2,!.
continous([Head1,Head2|Rest]):-
	check(Head1,Head2),
	continous([Head2|Rest]).
continous([X]).
