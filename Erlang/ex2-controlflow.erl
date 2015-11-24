% Top line consumed somehow...
casey(Animal) ->
    case Animal of
        "dog" -> underdog;
        "cat" -> thundercat
    end.

elsa(Option) ->
    if
        Option > 0 -> positive;
        Option < 0 -> negative
    end.

% An Erlang module cannot export variables, only functions.

main(_) ->
    io:format("~w\n", [casey("dog")]),
    io:format("~w\n", [elsa("dog")]).
