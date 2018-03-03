move_disk(1,Beg,Aux,End):-
	write("Move Top of The Disk From ":Beg),
	write(" To ":End),nl.
move_disk(N,Beg,Aux,End):-
	M is N - 1,
	move_disk(M,Beg,End,Aux),
	move_disk(1,Beg,Aux,End),
	move_disk(M,Aux,Beg,End).
