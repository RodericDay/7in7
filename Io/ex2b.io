/*
How would you change / to return 0 if the denominator is zero?
*/

(5 / 0) println
// inf

div := Number getSlot("/")

Number / := method(d,
    if (d!=0, self div(d), 0)
)

(5 / 0) println
// 0

exit 0
