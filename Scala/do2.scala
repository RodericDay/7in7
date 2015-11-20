var text = "The name is Bond, James Bond."
val pairs = Map("James"->"Roderic", "Bond"->"Day")

def translate(text:String, pairs:Map[String, String]) : String = {
    // probably extremely inefficient. use regex?
    var copy = text
    pairs.foreach { pair => copy = copy.replace(pair._1, pair._2) }
    return copy
}

println( translate(text, pairs) )
