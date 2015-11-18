/*
• Modify the Sudoku solver to work on 9x9 puzzles.
• Make the Sudoku solver print prettier solutions.
*/

:- use_module(library(clpfd)).

valid_domain(List, Min, Max):- List ins Min..Max.

valid([]).
valid([Head|Tail]) :-
    all_different(Head),
    valid(Tail).

sudoku(Puzzle, Solution) :-
        Solution = Puzzle,
        Puzzle = [A1, B1, C1, D1, E1, F1, G1, H1, I1,
                  A2, B2, C2, D2, E2, F2, G2, H2, I2,
                  A3, B3, C3, D3, E3, F3, G3, H3, I3,
                  A4, B4, C4, D4, E4, F4, G4, H4, I4,
                  A5, B5, C5, D5, E5, F5, G5, H5, I5,
                  A6, B6, C6, D6, E6, F6, G6, H6, I6,
                  A7, B7, C7, D7, E7, F7, G7, H7, I7,
                  A8, B8, C8, D8, E8, F8, G8, H8, I8,
                  A9, B9, C9, D9, E9, F9, G9, H9, I9],

        valid_domain(Solution, 1, 9),

        Row1 = [A1, B1, C1, D1, E1, F1, G1, H1, I1],
        Row2 = [A2, B2, C2, D2, E2, F2, G2, H2, I2],
        Row3 = [A3, B3, C3, D3, E3, F3, G3, H3, I3],
        Row4 = [A4, B4, C4, D4, E4, F4, G4, H4, I4],
        Row5 = [A5, B5, C5, D5, E5, F5, G5, H5, I5],
        Row6 = [A6, B6, C6, D6, E6, F6, G6, H6, I6],
        Row7 = [A7, B7, C7, D7, E7, F7, G7, H7, I7],
        Row8 = [A8, B8, C8, D8, E8, F8, G8, H8, I8],
        Row9 = [A9, B9, C9, D9, E9, F9, G9, H9, I9],

        ColA = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
        ColB = [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        ColC = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
        ColD = [D1, D2, D3, D4, D5, D6, D7, D8, D9],
        ColE = [E1, E2, E3, E4, E5, E6, E7, E8, E9],
        ColF = [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        ColG = [G1, G2, G3, G4, G5, G6, G7, G8, G9],
        ColH = [H1, H2, H3, H4, H5, H6, H7, H8, H9],
        ColI = [I1, I2, I3, I4, I5, I6, I7, I8, I9],

        Box1 = [A1, B1, C1, A2, B2, C2, A3, B3, C3],
        Box2 = [A4, B4, C4, A5, B5, C5, A6, B6, C6],
        Box3 = [A7, B7, C7, A8, B8, C8, A9, B9, C9],
        Box4 = [D1, E1, F1, D2, E2, F2, D3, E3, F3],
        Box5 = [D4, E4, F4, D5, E5, F5, D6, E6, F6],
        Box6 = [D7, E7, F7, D8, E8, F8, D9, E9, F9],
        Box7 = [G1, H1, I1, G2, H2, I2, G3, H3, I3],
        Box8 = [G4, H4, I4, G5, H5, I5, G6, H6, I6],
        Box9 = [G7, H7, I7, G8, H8, I8, G9, H9, I9],

        valid([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9,
               ColA, ColB, ColC, ColD, ColE, ColF, ColG, ColH, ColI,
               Box1, Box2, Box3, Box4, Box5, Box6, Box7, Box8, Box9]).

main :- sudoku([
  _, _, 3, _, 2, _, 6, _, _,
  9, _, _, 3, _, 5, _, _, 1,
  _, _, 1, 8, _, 6, 4, _, _,
  _, _, 8, 1, _, 2, 9, _, _,
  7, _, _, _, _, _, _, _, 8,
  _, _, 6, 7, _, 8, 2, _, _,
  _, _, 2, 6, _, 9, 5, _, _,
  8, _, _, 2, _, 3, _, _, 9,
  _, _, 5, _, 1, _, 3, _, _
  ], Solution), writeln(Solution).
