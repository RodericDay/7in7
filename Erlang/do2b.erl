% • Write a program that reads a tic-tac-toe board presented as a list, or a
%   tuple of size nine. Return the winner (x or o) if a winner has been
%   determined, cat if there are no more possible moves, or no_winner if no
%   player has won yet.

analyze(TicTacToe) ->
    MovesLeft = lists:sum([1 || Cell <- TicTacToe, Cell=="."]),
    [A, B, C, D, E, F, G, H, I] = TicTacToe,
    if
        (A==B) and (B==C) and (A/=46) -> [A];
        (D==E) and (E==F) and (D/=46) -> [D];
        (G==H) and (H==I) and (G/=46) -> [G];
        (A==D) and (D==G) and (A/=46) -> [A];
        (B==E) and (E==H) and (B/=46) -> [B];
        (C==F) and (F==I) and (C/=46) -> [C];
        (A==E) and (E==I) and (E/=46) -> [E];
        (C==E) and (E==G) and (E/=46) -> [E];
        MovesLeft  > 0 -> "no_winner";
        MovesLeft == 0 -> "cat"
    end.

main(_) ->
    TicTacToe = "x.xoxo...",
    State = analyze(TicTacToe),
    io:format("~s\n", [State]).
