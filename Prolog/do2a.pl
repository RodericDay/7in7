% • Reverse the elements of a list.
% • Find the my_smallest element of a list.
% • Sort the elements of a list.
% Resource: http://www.anselm.edu/homepage/mmalita/culpro/index.html

my_reverse([], []).
my_reverse([H|T], L) :- my_reverse(T, R), append(R, [H], L).

my_smallest(L, V) :- member(V, L), \+ (member(Y, L), Y < V).

my_insert(X, A, L, R) :- append(P1, [A|P2], L), append(P1, [X, A|P2], R), !.

my_sort([A], [A]).
my_sort(L, [H|R]) :- my_smallest(L, H), select(H, L, X), my_sort(X, R), !.

main :- run_tests.

:- begin_tests(this).

test(my_reverse) :- my_reverse([-1,2,3,-2], [-2,3,2,-1]).
test(my_smallest) :- my_smallest([-1,2,3,-2], -2).
test(my_insert) :- my_insert(-2, -1, [-1,2,3,-2], [-2,-1,2,3,-2]).
test(subtract) :- subtract([1,2,3,4,5], [5], [1,2,3,4]).
test(my_sort) :- my_sort([5,7,1,1,3,6], [1,1,3,5,6,7]).

:- end_tests(this).
