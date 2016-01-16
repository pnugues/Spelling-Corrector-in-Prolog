max_member(C, [B|A]) :-
	max_member_(A, B, C).
	
max_member_([], A, A).
max_member_([A|C], B, D) :-
	(   A@=<B
	->  max_member_(C, B, D)
	;   max_member_(C, A, D)
	).
