// guards
def factorial(n: Int): Long = n match {
    case 0 => 1
    case x if x > 0 => factorial(n - 1) * n
}

println(factorial(20))

// regex
val reg = "[Tt]he".r // <- that guy
reg.findAllIn("The path of the righteous man").foreach(println)
reg.findFirstIn("THE the The").foreach(println)

// xml
val movies =
<movies>
    <movie genre="action">Pirates of the Caribbean</movie>
    <movie genre="fairytale">Edward Scissorhands</movie>
    <movie>The Incredibles</movie>
    <movie>WALL E</movie>
    <short>Jack Jack Attack</short>
    <short>Geri's Game</short>
</movies>

// nice accessors
println(movies.text)
// slash lets us search for tags (like XPath) ie: `\ "movie"`
(movies \ "_").foreach { movie => movie match {
    case <movie>{movieName}</movie> => println(movieName)
    case <short>{shortName}</short> => println(shortName + " (short)") }
}
val nodes = movies \ "movie"
// access nodes
println(nodes(0))
println(nodes.map(_ \ "@genre"))
