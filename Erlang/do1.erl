% • A function that uses recursion to return the number of words in a string.
% • A function that uses recursion to count to ten.
% • A function that uses matching to selectively print “success” or
%   “error: message” given input of the form {error, Message} or success.

% count number of words -> recursively count number of spaces " " == 32
% mishandles linebreaks, empty strings, etc.
wordcount([32|Tail]) -> 1 + wordcount(Tail);
wordcount([_|Tail]) -> wordcount(Tail);
wordcount([]) -> 1.

% infinite loop when N > 10
count(10) -> io:format("~w\n", [10]);
count(N) -> io:format("~w ", [N]), count(N+1).

% this should be fine. atoms, man!
selectively({error, Message}) -> io:format("error: ~s\n", [Message]);
selectively(success) -> io:format("~s\n", ["success"]).

% entry point with arbitrary input
main(_) ->
    N = wordcount("This is the story of a girl"),
    io:format("~w\n", [N]),
    count(1),
    selectively(success),
    selectively({error, "She cried a river and drowned the whole world"}).
