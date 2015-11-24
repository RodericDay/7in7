%% blocking echo server, take 1
% http://whileonefork.blogspot.ca/2011/01/erlang-vs-java-simple-echo-server.html
-module(echo).

-export([server/1]).

%% happy path
server(Port) when is_integer(Port), Port > 0, Port < 65536 + 1 ->
  io:format("Initializing echo on port ~w~n", [Port]),
  {ok, ListenSocket} = gen_tcp:listen(Port, [binary, {packet, 0}, {active, false}]),
  listenLoop(ListenSocket);
%% bad server args
server(Port) ->
  io:format("Invalid port specification; must be int, 1<=port<=65536. '~p' is invalid~n", [Port]).

listenLoop(ListenSocket) ->
  io:format("Blocking on accept...~n"),
  {ok, Socket} = gen_tcp:accept(ListenSocket), %%block waiting for connection

  %% Show the address of client & the port assigned to our new connection
  case inet:peername(Socket) of
    {ok, {Address, Port}} ->
      io:format("hello ~p on ~p~n", [Address, Port]);
    {error, Reason} ->
      io:format("peername failed :( ~p~n", [Reason])
  end,
  receiveAndEcho(Socket),
  io:format("Gracefully closing ur socket!~n"),
  ok = gen_tcp:close(Socket),
  listenLoop(ListenSocket).

receiveAndEcho(Socket) ->
  %% block waiting for data...
  case gen_tcp:recv(Socket, 0, 60 * 1000) of
    {ok, Packet} ->
      io:format("recv'd ~p!~n", [Packet]),
      gen_tcp:send(Socket, Packet),
      receiveAndEcho(Socket);
    {error, Reason} ->
      io:format("~p~n", [Reason])
  end.
