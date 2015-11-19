neighborhood([ home(norwegian, _, _, _, _)
          ,home(_, blue, _, _, _)
          ,home(_, _, _, milk, _)
          ,home(_, _, _, _, _)
          ,home(_, _, _, _, _) ]).


solve(Street) :-
  phrase(solve, [], [Street]).


solve -->
  init_neighborhood,
  left_of(home(_,green,_,coffee,_), home(_,white,_,_,_)),
  member(home(brit,red,_,_,_)),
  member(home(swede,_,_,_,dogs)),
  member(home(dane,_,_,tea,_)),
  member(home(german,_,prince,_,_)),
  member(home(_,_,bluemasters,beer,_)),
  member(home(_,_,pallmall,_,birds)),
  next_to(home(_,_,_,_,horse), home(_,yellow,dunhill,_,_)),
  member(home(_,_,_,_,zebra)),
  next_to(home(_,_,blends,_,_), home(_,_,_,_,cats)),
  next_to(home(_,_,blends,_,_), home(_,_,_,water,_)).


init_neighborhood, [Street] -->
  [],
  { neighborhood(Street) }.


left_of(H1, H2), [N] -->
  [N],
  { nextto(H1, H2, N) }.


next_to(H1, H2) -->
  left_of(H1, H2).

next_to(H1, H2) -->
  left_of(H2, H1).


member(H), [N] -->
  [N],
  { member(H, N) }.

main :- solve(J), maplist(writeln, J).
