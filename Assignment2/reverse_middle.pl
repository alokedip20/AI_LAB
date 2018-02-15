reverse_middle(List,Result):-
	reverse_middle_acc(List,[],Result).
reverse_middle_acc([],A,A).
reverse_middle_acc(List,A,Result):-
	my_length(List,Length),
	Middle is round(Length/2),
	Index1 is Middle - 1,
	left_half(List,Index1,Left),
	Index2 is Middle + 1,	
	right_half(List,Index2,Length,Right),
	my_reverse(Left,Left_half),
	my_reverse(Right,Right_half),
	extract_element(List,Middle,X),
	my_append(Left_half,[X|Right_half],Result).

extract_element([Head|Rest],Middle,X):-
	Middle = 1,
	X is Head,!.
extract_element([Head|Rest],Middle,X):-
	Middle > 1,
	M is Middle - 1,
	extract_element(Rest,M,X).

left_half(List,Index,Result):-
	left_half_acc(List,Index,[],Result).
left_half_acc(_,0,A,A).
left_half_acc([Head|Rest],Index,A,Result):-
	Index >= 1,
	I is Index - 1,
	my_append(A,[Head],R),
	left_half_acc(Rest,I,R,Result).

right_half(List,Start,End,Result):-
	right_half_acc(List,Start,End,[],Result).
right_half_acc(List,End,End,A,Result):-
	extract_element(List,End,X),
	my_append(A,[X],Result).
right_half_acc(List,Start,End,A,Result):-	
	Start =\= End,
	extract_element(List,Start,E),
	my_append(A,[E],P),
	S is Start + 1,
	right_half_acc(List,S,End,P,Result). 

my_append([],List,List).
my_append([Head1|List1],List2,[Head1|List3]):-
	my_append(List1,List2,List3).
	


