# Ruby Project: Mastermind
* After 1 week of learning file serialization and object oriented programming, now a game called 'Mastermind' will be built
* This game mainly focuses on your reasoning and logic skils to guess the color/code of the sequences of color/code.
* So, by default, a set of 4 different code/color will be stored secretly and the player has to guess all code/color used at correct position.
* If the guessed code/color is correct and at correct position, an indicator will indicate that
* If the guessed code/color is correc BUT at WRONG position, another indicator will indicate that
* If the gueseed code/color is wrong, no indictor will be shown
* Oh, and the indicator will not tell which code/color is correct, so the player has to guess it by him/herself to reason which indicator refers to which code/color.
---
7/11/21
* Testing with the comparing the input array with the 'secret' array.
* Main problem now is when the input given is similar number like in this case

```
guess_this = [2,4,3,5]
guess_input = [3,3,3,3]

#expected output for indicator
['O']
#only a '3' matches at position 3rd.

#But the code went like this
['X','X','O','X']

```
---
8/11/21
* Main problem of duplicates in input has been solved.
* All restraint of input has been handled including:
  * input digits less or more than 4
  * Out of range digits (less than 1 or more than 8)
  * No symbols/characters (by convertinb it all to 0)
---
9/11/21
* Add condition when a player win or lose.
* Add GUI Board to show previous selection/combination of sequences.
---