remove_dup(L,L1):-duplicate_acc(L,[],L1).
duplicate_acc([],A,A).
duplicate_acc([H|T],A,L1):-member_of(H,A),!,duplicate_acc(T,A,A1).
duplicate_acc([H|T],A,L1):-duplicate_acc(T,[H|A],L1).
