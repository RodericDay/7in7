// very odd way to think of this... but let's try anyway
val cells = io.Source.fromFile("ttt.txt").mkString diff "\n\n\n"

// only 8 combos possible
var sol = None

Array(
    /* rows */
    (0 until 3),
    (3 until 6),
    (6 until 9),
    /* cols */
    (0 until 9 by 3),
    (1 until 9 by 3),
    (2 until 9 by 3),
    /* diags */
    (0 until 9 by 4),
    (2 until 8 by 2)
).foreach { indices =>
    var sol = indices.map{ i => cells(i) }.mkString("")
    if(sol=="xxx") { println("x won") }
    if(sol=="ooo") { println("o won") }
}
