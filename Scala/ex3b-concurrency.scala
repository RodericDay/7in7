/*
/Users/roderic/Developer/7in7/Scala/ex3b-concurrency.scala:26: warning: object Actor in package actors is deprecated: Use the akka.actor package instead. For migration from the scala.actors package refer to the Actors Migration Guide.
    val caller = self
                 ^
/Users/roderic/Developer/7in7/Scala/ex3b-concurrency.scala:28: warning: object Actor in package actors is deprecated: Use the akka.actor package instead. For migration from the scala.actors package refer to the Actors Migration Guide.
        actor { caller ! (url, PageLoader.getPageSize(url)) }
        ^
/Users/roderic/Developer/7in7/Scala/ex3b-concurrency.scala:31: warning: object Actor in package actors is deprecated: Use the akka.actor package instead. For migration from the scala.actors package refer to the Actors Migration Guide.
        receive {
        ^
three warnings found
*/

import scala.io._
// many deprecation warnings for these two
import scala.actors._
import Actor._

object PageLoader {
    def getPageSize(url : String) = Source.fromURL(url).mkString.length
}

// encoding issues w/ google.com
val urls = List("http://www.amazon.com/", "http://www.tastespotting.com" ,
                "http://www.firefox.com/" , "http://www.cnn.com/" )

def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start)/1000000000.0 + " seconds.")
}


// real functions
def getPageSizeSequentially() = {
    for(url <- urls) {
        val N = PageLoader.getPageSize(url)
        println("Size for " + url + ": " + N)
    }
}

def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
        actor { caller ! (url, PageLoader.getPageSize(url)) }
    }
    for(i <- 1 to urls.size) {
        receive {
            case (url, size) => println("Size for " + url + ": " + size)
        }
    }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Concurrent run")
timeMethod { getPageSizeConcurrently }
