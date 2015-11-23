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
            case e: java.io.IOException => size = -1
        }
        return size
    }
}

def parseHub(path:String) {
    val source = new org.xml.sax.InputSource(path)
    val doc = adapter.loadXML(source, parser)
    val links = (doc \\ "a").map(_ \\ "@href")
                            .filter(_.length>0)
                            .map(_.mkString)
                            .map(l => if(l.startsWith("http")) l else path+l)
    val fmtstr = "%s [%s kB] [%s links]"
    println(fmtstr format (path, doc.mkString.size/1000, links.length))

    val caller = actors.Actor.self
    for(link <- links) {
        actors.Actor.actor { caller ! (link, PageLoader.getPageSize(link)) }
    }
    for(i <- 1 to links.size) {
        actors.Actor.receive {
            case (link, size) =>
                println("\t[%s bytes] %s" format (size, link))
        }
    }
}

List("http://www.amazon.com").map(parseHub)
