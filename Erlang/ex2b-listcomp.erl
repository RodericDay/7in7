% • A list comprehension takes the form of
%       [Expression || Clause1, Clause2, ..., ClauseN].
% • List comprehensions can have an arbitrary number of clauses.
% • The clauses can be generators or filters.
% • A filter can be a boolean expression or a function returning a boolean.
% • A generator, of the form Match <-List, matches a pattern on the left to
%   the elements of a list on the right.

main(_) ->
    Cart = [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}],
    WithTax = [{Product, Quantity, Price, Price * Quantity * 0.08}
            || {Product, Quantity, Price} <- Cart],
    io:format("~w\n", [WithTax]),
    Cat = [{Product, Price} || {Product, _, Price} <- Cart],
    DiscountedCat = [{Product, Price / 2} || {Product, Price} <- Cat],
    io:format("~w\n", [DiscountedCat]),
    io:format("~w\n", [[X||X <-[1,2,3,4],X<4,X>1]]),
    io:format("~w\n", [[{X,Y}||X <-[1,2,3,4],X<3,Y<-[5,6]]]).
