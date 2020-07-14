# Zombie Dice

## Rules of the game 
"Zombie Dice" is a party game that can be played by 2-8 players. The players are zombies and the goal is to eat as much as possible brains.

There are 13 dices in different colors with different faces - brain, steps or shotgun.
The zombie that collects 13 brains win the game.

The first player select 3 of the dices and rolls them. If they have:
 - brain - they earn 1 point
 - steps - they may return this dice in the remaining
 - shotgun - if they collect 3 shotguns for 1 turn, they will die and won't earn any points
 
If the first player decide, they can choose another 3 dices of the remaining and roll again. If they decide not to continue, their points from this turn are added and the next player starts.

The dices are with 6 sides and can be:
 - green(6) - this dice has 3 brains, 2 steps and 1 shotgun
 - yellow(4) - this dice has 2 brains, 2 steps and 2 shotguns
 - red(3) - this dice has 1 brain, 2 steps and 3 shotguns

>For more information see: [https://en.wikipedia.org/wiki/Zombie_Dice](https://en.wikipedia.org/wiki/Zombie_Dice)

## How to build

This version of "Zombie Dice" is written in Swift 5.0.1. So before you begin, you will need:

 - at least Swift 5.0.1 on your machine
 - clone this repository - https://github.com/yugunchevska/Zombie-Dice.git

Go to /src/main/ folder from this repository and execute:

    swiftc -o main Dice.swift DiceManager.swift GameManager.swift Zombie.swift main.swift
And after the compilation is ready, to run the game execute:

    ./main

## How to play

When the game asks questions, it will display the possible answers like that: 

    [Y/N]
and will expect to input one of these answers and hit ENTER. If the player inputs another answer, the game will print appropriate message and wait until the right answer is given. If there are no possible answers, the player can write whatever they want and then hit ENTER. 

When it's player N turn, the game will choose three random dices and according to their types(green, yellow or red), it will select random faces of the dices(brain, steps or shotgun).

Once the game starts, it will ask you how many players want to be included and what are their nicknames.
After that it will follow a pattern. Let's say we have 2 players with names Yuliana and Valentin:

    ===
     -------------------
    | Name     | Points |
     -------------------
    | Yuliana  | 0      |
     -------------------
    | Valentin | 0      |
     -------------------
    Current turn: Yuliana
    ===
    Yuliana chose dice of types YELLOW, GREEN, YELLOW
    After rolling Yuliana has 👣  💥  💥
    ===
    Do you want to continue? [Y/N]
    > y
    Do you want to return the YELLOW dice? [Y/N]
    > n
    ===
    Yuliana chose dice of types GREEN, RED, GREEN
    After rolling Yuliana has 👣  👣  💥
    ===
    Zombie Yuliana is dead for this round. 💀
    
    ===
     -------------------
    | Name     | Points |
     -------------------
    | Yuliana  | 0      |
     -------------------
    | Valentin | 0      |
     -------------------
    Current turn: Valentin
    ...
The game ends when one of the players collect 13 brains. After that it will ask, if you want to play again with the same players, otherwise, the whole program ends.