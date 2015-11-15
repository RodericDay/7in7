/*
Enhance the XML program to handle attributes: if the first argument is a map
(use the curly brackets syntax), add attributes to the XML program.

Builder book({"author": "Tate"})
// <book author="Tate">

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

{"Name": "John", "Age": 28, "Profession": "Painter"} asObject println
