union([],L,L).
union([X|L1],L2,L3):-member_of(X,L2),union(L1,L2,L3),!.
union([X|L1],L2,[X|L3]):-union(L1,L2,L3).
