/*
• Take the sizer application and add a message to count the number of links
  on the page.
• Bonus problem: Make the sizer follow the links on a given page, and load
  them as well. For example, a sizer for “google.com” would compute the
  size for Google and all of the pages it links to.

NOTE: tagsoup-1.2.1.jar was manually placed in libexec for HTML parsing to work
      Gradle is the proper way
*/

import akka.actor._

// set up TagSoup parsing
val parserFactory = new org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl
val parser = parserFactory.newSAXParser()
val adapter = new scala.xml.parsing.NoBindingFactoryAdapter

def parseHub(path:String) {
    val source = new org.xml.sax.InputSource(path)
    val doc = adapter.loadXML(source, parser)
    val links = (doc \\ "a").map(_ \\ "@href")
                            .filter(_.length>0)
                            .map(_.mkString)
                            .map(l => if(l.startsWith("http")) l else path+l)
    val fmtstr = "%s [%s kB] [%s links]"
    println(fmtstr format (path, doc.mkString.size/1000, links.length))
    links.map(parseLink)
}

def parseLink(path:String) {
    var size = 0
    try {
        val source = new org.xml.sax.InputSource(path)
        val doc = adapter.loadXML(source, parser)
        size = doc.mkString.size
    } catch {
        case e: java.io.FileNotFoundException    => val err = "404"
        case e: java.io.IOException              => val err = "500+"
    } finally {
        println("\t[%s bytes] %s" format (size, path.slice(0, 80)))
    }
}

List("http://www.amazon.com").map(parseHub)
