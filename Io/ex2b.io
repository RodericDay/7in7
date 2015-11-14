/*
How would you change / to return 0 if the denominator is zero?
*/

div := Number getSlot("/")

Number / := method(d,
    if (d!=0, self div(d), 0)
)

(5 / 0) println

exit 0
