a(["anun"]).
b(["kura", "tama"]).
c(["su", "kuru","xanadu"]).
d(["unuri"]).
e(["bimo","co"]).
f(["sonen", "ariten"]).
g(["sicom"]).
h(["kana"]).
i(["te", "shime"]).
poem(0).
poem(N):-
	a(A),
	b(B),
	c(C),
	d(D),
	e(E),
	f(F),
	g(G),
	h(H),
	i(I),
	random_permutation(A,As),
	random_permutation(B,Bs),
	random_permutation(C,Cs),
	random_permutation(D,Ds),
	random_permutation(E,Es),
	random_permutation(F,Fs),
	random_permutation(G,Gs),
	random_permutation(H,Hs),
	random_permutation(I,Is),
	
	member(A1, As),
	member(B1, Bs),
	member(B2, Bs),
	member(C1, Cs),
	member(C2, Cs),
	member(C3, Cs),
	member(D1, Ds),
	member(E1, Es),
	member(E2, Es),
	member(F1, Fs),
	member(F2, Fs),
	member(G1, Gs),
	member(H1, Hs),
	member(I1, Is),
	member(I2, Is),
	
	write(A1), write(" "),
	write(B1), write(" "),
	write(B2), write(" "),
	write(C1), nl,
	write(D1), write(" "),
	write(E1), write(" "),
	write(E2), write(" "),
	write(C2), nl,
	write(F1), write(" "),
	write(F2), write(" "),
	write(G1), nl,
	write(H1), write(" "),
	write(I1), write(" "),
	write(I2), write(" "),
	write(C3), nl,nl,
	N1 is N - 1,
	poem(N1).
