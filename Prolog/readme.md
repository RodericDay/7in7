Prolog
======

- To work like I like to, using scripts and read-eval-print-loops, takes a bit of work, but it is possible. Check out the code samples for two methods. One uses tests (set `goal -g run_tests`), the other mocks a `main` entry point.
- Some syntax decisions are plain bizarre (`,` for `and`, `;` for `or`).
- Sudoku solver fails on Sudokus that require guessing (Project Euler)
- Be careful of coercing imperative programming tactics into declarative and deluding oneself by abusing atoms.
- Some tactics exist to make coding more pleasant (see `eazar`'s code).
- The `##prolog` channel and the [`swipl` docs](http://www.swi-prolog.org/pldoc/index.html) turned out to be the best resources. [Mihaela Malita's notes](http://www.anselm.edu/homepage/mmalita/culpro/index.html) were also very useful to just get going, but I don't know how well they fare as proper examples.
- The use of "cut" (`!`) needs to be understood, it seems to really mess with a lot of the perceived elegance in Prolog.
