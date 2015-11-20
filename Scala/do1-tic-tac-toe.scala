/*
http://www.scala-lang.org/api/current/index.html
http://www.scala-lang.org/docu/files/collections-api/collections_0.html

Notes and observations:
- io.Source.fromFile("ttt.txt").mkString diff "\n\n\n"
- getClass.getSimpleName
- what's up with optional dots
- what's up with this import as a result of a warning?
*/
import scala.language.postfixOps

// the "game" in progress is represented by a simple array
// some key functions manipulate the array
// 0 is empty, 1 is for player 1, 2 is for player 2
val game = ".........".toCharArray

// only 8 combos possible
def checkState { Array(
    /* rows */  (0 until 3),        (3 until 6),        (6 until 9),
    /* cols */  (0 until 9 by 3),   (1 until 9 by 3),   (2 until 9 by 3),
    /* diag */  (0 until 9 by 4),   (2 until 8 by 2)    ) foreach { r =>
    val combo = r map { game(_) } mkString;
    if (combo=="XXX" || combo=="OOO") throw new FinalState("You won")
    }
}

def handleInput(player: Char) {
    (3 to 1 by -1).foreach { i =>
        try {
            val input = io.StdIn.readLine("Move x y: ")
                                .split(" ")
                                .map(Integer.parseInt)
            val (x, y) = (input(0), input(1))
            val i = x + 3*y - 4
            if ( game(i)!='.' ) { throw new NullPointerException }
            game(i) = player
            checkState
            return
        } catch {
            case e: NullPointerException            => println(i+" tries left")
            case e: ArrayIndexOutOfBoundsException  => println(i+" tries left")
            case e: NumberFormatException           => println(i+" tries left")
        }
    }
    throw new FinalState(player+" lost")
}

def displayBoard {
    println("     x\n    123")
    println("  1 "+ game.slice(0,3).mkString)
    println("y 2 "+ game.slice(3,6).mkString)
    println("  3 "+ game.slice(6,9).mkString)
    println()
}

class FinalState(msg: String) extends RuntimeException(msg)
var currentPlayer = 'X'
while (true) {
    displayBoard
    println("It is Player "+currentPlayer+"'s turn")
    try {
        handleInput(currentPlayer)
    } catch {
        case e: FinalState => displayBoard; println(e); System.exit(0)
    }
    currentPlayer = if (currentPlayer == 'X') 'O' else 'X'
}
