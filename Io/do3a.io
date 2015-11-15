/*
Enhance the XML program to add spaces to show the indentation structure.
*/

Sequence concat := method(other, self cloneAppendSeq(other))

Builder := Object clone
Builder indentLevel := 0
Builder indent := method("  " repeated(indentLevel))
Builder forward := method(

    writeln(indent, "<", call message name, ">")
    self indentLevel = self indentLevel + 1
    call message arguments foreach(arg,

        content := self doMessage(arg);
        if(content type == "Sequence", writeln("  ", indent, content))

    )
    self indentLevel = self indentLevel - 1
    writeln(indent, "</", call message name, ">")

)


Builder  html(body(ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))))
