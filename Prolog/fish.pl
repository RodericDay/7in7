/*
nationality = brit, dane, german, norwegian, swede
colors      = blue, green, red, white, yellow
beverages   = beer, coffee, milk, tea, water
smokes      = bluemaster, dunhill, pallmall, prince, blend
keeps       = cat, bird, dog, fish, horse
position    = 1, 2, 3, 4, 5
*/

% 1.  The Brit lives in a red house.
% 2.  The Swede keeps dogs as pets.
% 3.  The Dane drinks tea.
% 4.  The green house is on the left of the white house (next to it).
% 5.  The green house owner drinks coffee.
% 6.  The person who smokes Pall Mall rears birds.
% 7.  The owner of the yellow house smokes Dunhill.
% 8.  The man living in the house right in the center drinks milk.
% 9.  The Norwegian lives in the first house.
% 10. The man who smokes blend lives next to the one who keeps cats.
% 11. The man who keeps horses lives next to the man who smokes Dunhill.
% 12. The owner who smokes Blue Master drinks beer.
% 13. The German smokes Prince.
% 14. The Norwegian lives next to the blue house.
% 15. The man who smokes blend has a neighbor who drinks water.

mutually_exclusive([A|As],S):- select(A,S,S1), mutually_exclusive(As,S1).
mutually_exclusive([],_).

left_of(A,B,C):- append(_,[A,B|_],C).
next_to(A,B,C):- left_of(A,B,C) ; left_of(B,A,C).

solve(All) :-
  All   = [ (_,norwegian,_,_,_),
            (blue,_,_,_,_),
            (_,_,_,milk,_),
            _,
            _ ],
  mutually_exclusive([  (red,brit,_,_,_),
                        (_,swede,dog,_,_),
                        (_,dane,_,tea,_),
                        (_,german,_,_,prince)
                        ], All),
  mutually_exclusive([  (_,_,birds,_,pallmall),
                        (yellow,_,_,_,dunhill),
                        (_,_,_,beer,bluemaster),
                        (_,_,fish,_,_)
                        ], All),
  left_of(  (green,_,_,coffee,_),
            (white,_,_,_,_), All),
  next_to(  (_,_,_,_,dunhill),
            (_,_,horse,_,_), All),
  next_to(  (_,_,_,_,blend),
            (_,_,cats, _,_), All),
  next_to(  (_,_,_,_,blend),
            (_,_,_,water,_), All).

main :- solve(All), maplist(writeln, All).
