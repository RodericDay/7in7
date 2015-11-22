class Script(sourcePath:String) {

    val lines = io.Source.fromFile(sourcePath).mkString.split('\n')

    def display() = lines.map(println)

    def length():Int = return lines.foldLeft(0)((sum, line) => sum+line.length)

}

trait Censored {

    var pairs = Map.empty[String, String]
    io.Source.fromFile("do2-censored.txt")
             .mkString.split('\n').map(_.split(':'))
             .foreach { pair => pairs += Tuple2(pair(0), pair(1)) }

    def translate(text:String) : String = {
        // probably extremely inefficient. use regex?
        var copy = text
        pairs.foreach { pair => copy = copy.replace(pair._1, pair._2) }
        return copy
    }

}

class CensoredScript(sourcePath:String) extends Script(sourcePath) with Censored {

    override def display() = lines.map(translate).map(println)

}

val script = new Script("do2-script.txt")
script.display
val censoredScript = new CensoredScript("do2-script.txt")
censoredScript.display
