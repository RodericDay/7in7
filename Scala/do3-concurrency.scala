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

// val path = "http://www.amazon.com"
val path = "../docs/Io Programming Guide.html"

val parserFactory = new org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl
val parser = parserFactory.newSAXParser()
val source = new org.xml.sax.InputSource(path)
val adapter = new scala.xml.parsing.NoBindingFactoryAdapter
val doc = adapter.loadXML(source, parser)
println(doc \ "div")
