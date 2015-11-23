/*
• Take the sizer application and add a message to count the number of links
  on the page.
• Bonus problem: Make the sizer follow the links on a given page, and load
  them as well. For example, a sizer for “google.com” would compute the
  size for Google and all of the pages it links to.

NOTE: tagsoup-1.2.1.jar was manually placed in libexec for HTML parsing to work
      Gradle is the proper way
*/

// set up TagSoup parsing
val parserFactory = new org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl
val parser = parserFactory.newSAXParser()
val adapter = new scala.xml.parsing.NoBindingFactoryAdapter

object PageLoader {
    def getPageSize(url : String):Integer = {
        var size = 0
        try {
            size = io.Source.fromURL(url).mkString.length
        } catch {
            case e: java.io.IOException => size = 0
        }
        return size
    }
}

def parseHub(path:String) {
    val source = new org.xml.sax.InputSource(path)
    val doc = adapter.loadXML(source, parser)
    val links = (doc \\ "a").map(_ \\ "@href")
                            .map(_.mkString)
                            .filter(_.length>1)
                            .filter(!_.startsWith("#"))
                            .filter(!_.contains("?"))
                            .map(l => if(l.startsWith("/")) path+l else l)
    println("%s [%s kB]" format (path, doc.mkString.size/1000))

    var sum = 0
    val caller = actors.Actor.self
    for(link <- links) {
        actors.Actor.actor { caller ! (link, PageLoader.getPageSize(link)) }
    }
    for(i <- 1 to links.size) {
        actors.Actor.receive {
            case (link, size:Integer) => sum += size
                // println("\t[%s bytes] %s" format (size, link)) // toggle for debug
        }
    }
    println("%s kB in %s links" format (sum/1000, links.length))
}

List("http://www.google.com", "http://tastespotting.com").map(parseHub)
