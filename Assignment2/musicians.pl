band_soloist(band(soloist(N1, C1, I1),soloist(N2, C2, I2),soloist(N3, C3, I3))).
first(X, band(X ,_ ,_)).
named(soloist(N, _, _), N).
country(soloist(_, C,  _), C).
plays(soloist(_, _, I), I).

ordered_member(X, Y, band(X, Y, _)).
ordered_member(X, Z, band(X, _, Z)).
ordered_member(Y, Z, band(_, Y, Z)).
member1(X, band(X, _, _)).
member1(Y, band(_, Y, _)).
member1(Z, band(_, _, Z)).



musician_solution(S):-
	band_soloist(S),
	first(X1, S), plays(X1, piano),
	ordered_member(Y1,Z1, S), named(Y1, john), plays(Y1, saxophone), country(Z1, australia),
	ordered_member(X2, Z2, S), named(X2, mark), country(X2, us), plays(Z2, violin),
	member1(X3, S), country(X3, japan),
	member1(Y3, S), named(Y3, sam).
