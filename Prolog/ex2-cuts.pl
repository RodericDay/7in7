% (discussion w/ dmiles_afk on ##prolog)
max(X,Y,X):- X > Y, !.
max(X,Y,Y):- X =< Y.
% thats a white cut
% does not change solution, but improves performance
% http://clip.dia.fi.upm.es/~vocal/public_info/seminar_notes/node49.html

main :- max(9, 20, N), writeln(N).
