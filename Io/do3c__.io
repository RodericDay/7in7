/*
Enhance the XML program to handle attributes: if the first argument is a map
(use the curly brackets syntax), add attributes to the XML program.

Builder book({"author": "Tate"})
// <book author="Tate">...</book>

Note: This file will not run correctly stand-alone.
      The interpreter parses operators before interpreting the statments that
      add new ones in. This means they need to be "shuffled" in ahead of time,
      via a supervisor file.
*/


Map colonAssign := method(

    self atPut(

        call message argAt(0) asSimpleString strip("\""),
        call message argAt(1)

    )

)


curlyBrackets := method(

    map := Map clone
    call message arguments foreach(definition, map doMessage(definition) )
    map

)


Map toFlatString := method(

    // probably not the best way to do this lol

    0 to(self size-1) map(n,

        list( self keys at(n), self values at(n) ) join("=")

    ) join(" ")

)


Sequence concat := method(other, self cloneAppendSeq(other))

Builder := Object clone
Builder indentLevel := 0
Builder indent := method("  " repeated(indentLevel))
Builder forward ::= method(

    write(indent, "<", call message name)
    self indentLevel = self indentLevel + 1
    call message arguments foreach(arg,

        content := self doMessage(arg);
        if(content type == "Map", writeln(" ", content toFlatString, ">"))
        if(content type == "Sequence", writeln("  ", indent, content))

    )
    self indentLevel = self indentLevel - 1
    writeln(indent, "</", call message name, ">")

)


Builder meal({"type": "lunch", "cost": 99},
            appetizer("soup"),
            main({"vegetarian": true}, "pasta"),
            dessert("ice cream"),
            notes
        )
