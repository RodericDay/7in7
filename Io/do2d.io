/*
Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)
*/

SuspiciousError := Exception clone

List myAverage := method(

    try(
        a := self sum / self size
    ) catch(Exception,
        SuspiciousError raise("Sneaky sneaky!")
    )

    a
)

l1 := list(5, 6, 12, 8, 8, 2, 3)
l1 average println
l1 myAverage println

// no items -> sum is nil

l2 := list(1, 2, "cabbage")
l2 myAverage

exit 0
