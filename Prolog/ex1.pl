% establish truths
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

% service predicates, check the library and use that if available
forall(X,Y) :- \+ (X, \+ Y).
writeln(T) :- write(T), nl.

% define queries we want answers to
query(likes(wallace, cheese)).
query(likes(mickey, whisky)).

% run script
:- initialization main.
main :-
    forall(query(Q), (Q -> writeln(Q:yes) ; writeln(Q:no))),
    halt.
