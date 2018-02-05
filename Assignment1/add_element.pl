our_add(A,[],[A]).
our_add(A,L,L):-member_of(A,L),!.
our_add(A,L,[A|L]).
