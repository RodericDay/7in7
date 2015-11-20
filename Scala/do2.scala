var text = "The name is Bond, James Bond."

def fromFile(path:String) : Map[String, String] = {
    var map = Map.empty[String, String]
    var pairs = io.Source.fromFile(path).mkString.split('\n').map(_.split(':'))
    pairs.foreach { pair => map += Tuple2(pair(0), pair(1)) }
    return map
}

def translate(text:String, pairs:Map[String, String]) : String = {
    // probably extremely inefficient. use regex?
    var copy = text
    pairs.foreach { pair => copy = copy.replace(pair._1, pair._2) }
    return copy
}

def length(script:List[String]) : Integer = {
    // use fold to check size of text
    return script.foldLeft(0)( (sum, line) => sum + line.length )
}

val pairs = fromFile("do2.txt")
println( translate(text, pairs) )
