cola(0):-
	write('no bottle of cola on the wall').
cola(1):-
	!,
	write('1 bottle of cola on the wall'),nl,
	write('You take one down and pass it around'),nl,
	cola(0).
cola(N):-
	write(N:'bottles of cola on the wall'),nl,
	write('You take one down and pass it around'),nl,
	N1 is N - 1,
	cola(N1).
