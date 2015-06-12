% New predicate needed for YAP as split/2 is not provided by SWI-Prolog

count_errors(Target:WrongAtom, ErrCnt) :-
    atom_to_chars(WrongAtom, WrongString),
    split(WrongString, WrongsStrings),
    maplist(atom_to_chars, Wrongs, WrongsStrings),
    maplist(correct, Wrongs, Corrects),
    cnt(Target, Corrects, 0, ErrCnt).
