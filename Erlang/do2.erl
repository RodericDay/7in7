% • Consider a list of keyword-value tuples, such as
%       [{erlang, "a func- tional language"}, {ruby, "an OO language"}].
%   Write a function that accepts the list and a keyword and returns the
%   associated value for the keyword.
% • Consider a shopping list that looks like
%       [{item quantity price}, ...].
%   Write a list comprehension that builds a list of items of the form
%       [{item total_price}, ...],
%   where total_price is quantity times price.

getvalue(Choice, Pairs) -> lists:last([Value
                        || {Key, Value}<-Pairs, Key==Choice]).

aggregate(Items) -> [{X,NX*P}||{X,NX,P} <- Items].

main(_) ->
    Pairs = [{a,1},{b,2},{c,3}],
    io:format("~w\n", [getvalue(a, Pairs)]),
    Items = [{shoes,2,100},{beer,12,2}],
    io:format("~w\n", [aggregate(Items)]).

