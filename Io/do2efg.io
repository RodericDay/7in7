/*
Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

Write the matrix to a file, and read a matrix from a file.
*/

Number to := method(end,

    range := Range clone
    range setRange(self, end)
    range

)

Matrix := Object clone
Matrix readFile := method(fileName,

    matrix := Matrix clone
    matrix data := File with(fileName) readLines map(split map(asNumber))
    matrix

)
Matrix get := method(x, y, self data at(y) at(x))
Matrix set := method(x, y, value,

    self data at(y) atPut(x, value)
    nil

)
Matrix asString := method(

    self data map(join(" ")) join("\n")

)
Matrix display := method( self asString println "\n" print )
Matrix writeFile := method(fileName,

    f := File with(fileName)
    f remove
    f openForUpdating
    f write(self asString)

)
Matrix nrows := method( self data size )
Matrix ncols := method( self data at(0) size )
Matrix size := method( list(self nrows, self ncols) )
Matrix new := method(x, y,

    matrix := Matrix clone
    matrix data := 0 to(x-1) map( 0 to(y-1) map(nil) )
    matrix

)
Matrix transpose := method(

    new_matrix := Matrix new(self ncols, self nrows)
    0 to(self ncols-1) foreach(i,
        0 to(self nrows-1) foreach(j,
            new_matrix set(j, i, self get(i, j) )
        )
    )
    new_matrix

)

matrix := Matrix readFile("matrix.txt")
matrix size println
matrix display
matrix set(2, 2, -1)
matrix display
new_matrix := matrix transpose
new_matrix display
new_matrix writeFile("new_matrix.txt")
