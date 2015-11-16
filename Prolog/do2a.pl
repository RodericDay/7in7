% • Reverse the elements of a list.
% • Find the smallest element of a list.
% • Sort the elements of a list.

my_reverse([], []).
my_reverse([H|T],L) :- my_reverse(T,R), append(R,[H],L).

:- begin_tests(this).

test(this) :- my_reverse([1,2,3], [3,2,1]).
test(this) :- nl,
            read_term_from_atom(
                'my_reverse([1,2,3], DUMMY).',
                IfTrue,
                [variable_names(S)]
            ),
            IfTrue -> writeln(S).

:- end_tests(this).
