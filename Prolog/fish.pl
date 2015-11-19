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

  % 1.  The Brit lives in a red house.
  member( (_,brit,red,_,_,_), Neighborhood),

  % 2.  The Swede keeps dogs as pets.
  member( (_,swede,_,_,_,dog), Neighborhood),

  % 3.  The Dane drinks tea.
  member( (_,dane,_,tea,_,_), Neighborhood),

  % 4.  The green house is on the left of the white house (next to it).
  member( (A,_,green,_,_), Neighborhood), B is A+1,
  member( (B,_,white,_,_), Neighborhood),

  % 5.  The green house owner drinks coffee.
  member( (_,_,green,coffee,_,_), Neighborhood),

  % 6.  The person who smokes Pall Mall rears birds.
  member( (_,_,_,_,pallmall,birds), Neighborhood),

  % 7.  The owner of the yellow house smokes Dunhill.
  member( (_,_,yellow,_,dunhill,_), Neighborhood),

  % 8.  The man living in the house right in the center drinks milk.
  member( (3,_,_,milk,_,_), Neighborhood),

  % 9.  The Norwegian lives in the first house.
  member( (1,norwegian,_,_,_,_), Neighborhood),

  % 10. The man who smokes blend lives next to the one who keeps cats.
  member( (C,_,_,_,blend,_), Neighborhood), plus_or_minus_one(C, D),
  member( (D,_,_,_,_,cats), Neighborhood),

  % 11. The man who keeps horses lives next to the man who smokes Dunhill.
  member( (E,_,_,_,_,horses), Neighborhood), plus_or_minus_one(E, F),
  member( (F,_,_,_,dunhill,_), Neighborhood),

  % 12. The owner who smokes Blue Master drinks beer.
  member( (_,_,_,beer,bluemaster,_), Neighborhood),

  % 13. The German smokes Prince.
  member( (_,german,_,_,prince,_), Neighborhood),

  % 14. The Norwegian lives next to the blue house.
  member( (G,norwegian,_,_,_,_), Neighborhood), plus_or_minus_one(G, H),
  member( (H,_,blue,_,_,_), Neighborhood),

  % 15. The man who smokes blend has a neighbor who drinks water.
  member( (I,_,_,_,blend,_), Neighborhood), plus_or_minus_one(I, J),
  member( (J,_,_,water,_,_), Neighborhood),

  % Question: Who owns the fish?
  member( (_,_,_,_,_,fish), Neighborhood).

% This is probably very very very bad practice
plus_or_minus_one(I, J) :- Im is I-1, Ip is I+1, member(J, [Im, Ip]).

main :- solve(Neighborhood), maplist(writeln, Neighborhood).
