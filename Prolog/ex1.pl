% establish truths
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

:- begin_tests(this).

test(this) :- likes(wallace, cheese).
test(this) :- bagof(Who, likes(Who, cheese), [wallace, grommit]).
test(this) :- \+ bagof(Who, likes(Who, wine), [wallace]).

test(printing) :- nl,
            read_term_from_atom(
                'bagof(Who, likes(Who, cheese), LIST).',
                IfTrue,
                [variable_names(S)]
            ),
            IfTrue -> writeln(S).

:- end_tests(this).
