# basics
Vehicle := Object clone
Vehicle description := "Something to take you places"
Vehicle print

Car := Vehicle clone
Car description = "Four wheels"
Car print

ferrari := Car clone
ferrari type println

Car drive := method("Vroom" println)
ferrari drive

Lobby print

list(1, 2, 3, 4) average println
# size, average, sum, at(i), append(x), pop, prepend(i), isEmpty

elvis := Map clone
elvis atPut("friend", "Joanna")
elvis atPut("color", "gray")
elvis asObject print
# at, asObject, asList, keys, size

# true proto print
# singleton!
atom := Object clone
atom clone := atom
atom print
atom clone print

# last number error code
0
