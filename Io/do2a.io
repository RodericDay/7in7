/*
A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on.

Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.
*/


/* for( <counter>,
        <start>,
        <end>,
        <optional step>,
        <do message>)
*/

fib := method(N,

    a := 1
    b := 1
    for (i, 1, N,
        _ = b
        b = a + b
        a = _
    )

)

fib(20) println


/* if(  <condition>,
        <do message>,
        <else do message>)
*/

fibr := method(N,
    if(N==1 or N==2, 1, fib(N-1)+fib(N-2))
)

fibr(20) println


exit 0
