#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname factorial -mnesia debug verbose
% http://www.erlang.org/doc/man/escript.html
main([String]) ->
    try
        N = list_to_integer(String),
        F = fib(N),
        io:format("factorial ~w = ~w\n", [N,F])
    catch
        _:_ ->
            usage()
    end;

% tests
main(_) ->
    % usage().
    N = 27,
    io:format("fib(~w) = ~w\n", [N, fib(N)]).

usage() ->
    io:format("usage: factorial integer\n"),
    halt(1).

% not so fast
fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).
