/*
colors      = [blue, green, red, white, yellow]
nationality = [brit, dane, german, norwegian, swede]
beverages   = [beer, coffee, milk, tea, water]
smokes      = [bluemaster, dunhill, pallmall, prince, blend]
keeps       = [cat, bird, dog, fish, horse]
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



:- begin_tests(this).

test(printing) :- nl,
            read_term_from_atom(
                'keeps(Who, fish).',
                IfTrue,
                [variable_names(S)]
            ),
            IfTrue -> writeln(S).

:- end_tests(this).

