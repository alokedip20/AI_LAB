intersection([],L,[]).
intersection([X|L1],L2,[X|L3]):-member_of(X,L2),intersection(L1,L2,L3),!.
intersection([X|L1],L2,L3):-intersection(L1,L2,L3).
