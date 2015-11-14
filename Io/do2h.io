/*
Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.
*/

a := (Random value * 100) floor + 1
"I've guessed a number. You have ten tries to guess it."  println

guesses := list()
previousDifference := (1/0)
win := false

while(guesses size < 10,
    if(guesses contains(a), break)

    guess := ReadLine readLine
    guess = if(guess==nil, guesses size, guess asNumber)

    difference := (a - guess) abs
    if(previousDifference > difference, "Hotter", "Colder") println
    previousDifference = difference

    guesses append(guess)
)

if(guesses contains(a), "You win!", "You lost.") println
"Answer was #{a}" interpolate println

exit 0
