% this is meant to be passed with a maplist
% if arguments lend itself to it, call member
% else execute them as such
memb_or_call(L,E) :- member(E,L).
memb_or_call(_L,{E}) :- !, E.
% the cut tells REDO nothing would come from of combining
% the curly brackets to the list

solve(Neighborhood) :-

  /*
  the solution consists of five compounds
  each compound consists of the six traits of a house, in order

  position    = 1, 2, 3, 4, 5
  nationality = brit, dane, german, norwegian, swede
  colors      = blue, green, red, white, yellow
  beverages   = beer, coffee, milk, tea, water
  smokes      = bluemaster, dunhill, pallmall, prince, blend
  keeps       = cat, bird, dog, fish, horse
  */

  % the neighborhood looks like this
  Neighborhood = [
    (1,_,_,_,_,_),
    (2,_,_,_,_,_),
    (3,_,_,_,_,_),
    (4,_,_,_,_,_),
    (5,_,_,_,_,_)],

 maplist(memb_or_call(Neighborhood),[
  % 1.  The Brit lives in a red house.
    (_,brit,red,_,_,_),

  % 2.  The Swede keeps dogs as pets.
    (_,swede,_,_,_,dog),

  % 3.  The Dane drinks tea.
    (_,dane,_,tea,_,_),

  % 4.  The green house is on the left of the white house (next to it).
    (A,_,green,_,_),
    (B,_,white,_,_),
    {B is A+1},

  % 5.  The green house owner drinks coffee.
    (_,_,green,coffee,_,_),

  % 6.  The person who smokes Pall Mall rears birds.
    (_,_,_,_,pallmall,birds),

  % 7.  The owner of the yellow house smokes Dunhill.
    (_,_,yellow,_,dunhill,_),

  % 8.  The man living in the house right in the center drinks milk.
    (3,_,_,milk,_,_),

  % 9.  The Norwegian lives in the first house.
    (1,norwegian,_,_,_,_),

  % 10. The man who smokes blend lives next to the one who keeps cats.
    (C,_,_,_,blend,_),
    (D,_,_,_,_,cats),
    {plus_or_minus_one(C, D)},

  % 11. The man who keeps horses lives next to the man who smokes Dunhill.
    (E,_,_,_,_,horses),
    (F,_,_,_,dunhill,_),
    {plus_or_minus_one(E, F)},

  % 12. The owner who smokes Blue Master drinks beer.
    (_,_,_,beer,bluemaster,_),

  % 13. The German smokes Prince.
    (_,german,_,_,prince,_),

  % 14. The Norwegian lives next to the blue house.
    (G,norwegian,_,_,_,_),
    (H,_,blue,_,_,_),
    {plus_or_minus_one(G, H)},

  % 15. The man who smokes blend has a neighbor who drinks water.
    (I,_,_,_,blend,_),
    (J,_,_,water,_,_),
    {plus_or_minus_one(I, J)},

  % Question: Who owns the fish?
    (_,_,_,_,_,fish) ]).

% This is probably very very very bad practice
plus_or_minus_one(I, J) :- Im is I-1, Ip is I+1, member(J, [Im, Ip]).

main :- solve(Neighborhood), maplist(writeln, Neighborhood).
