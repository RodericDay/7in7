/*
Enhance the XML program to add spaces to show the indentation structure.

Create a list syntax that uses brackets.
Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program.

For example:

    book({"author": "Tate"}...)
    // <book author="Tate">
*/

Builder := Object clone
Builder forward := method(

    writeln("<", call message name, ">")
    call message arguments foreach(arg,

        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content))

    )
    writeln("</", call message name, ">")

)

/*
Builder  ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))
*/
