final class GameManager {
  private var zombies: [Zombie] = []

  init() {
    let playersCount = waitForAnswer(question: "Welcome to Zombie Dice (Swift edition). How many players wants to play?", expectedAnswers: ["2", "3", "4", "5", "6", "7", "8"])

    let zombieCount = Int(playersCount) ?? 2

    print("Choose names for your players.")
    for i in 1...zombieCount {
      print("Zombie name for player " + String(i) + ": ")

      if let name = readLine() {
        zombies.append(Zombie(name: name))
      } else {
        print("Player's name will be Anonymous")
        zombies.append(Zombie(name: "Anonymous"))
      }
    }
  }

  func startGame() {
    if zombies.isEmpty {
      return
    }

    while true {
      let hasWon = play(zombies: zombies)
      if hasWon {
        let playAgain = waitForAnswer(question: "Do you want to play again with the same players?", expectedAnswers: ["Y", "N"])
        if playAgain == "Y" {
          for zombie in zombies {
            zombie.resetPoints()
          }
          print()
        } else {
          break
        }
      }
    }
  }

  func play(zombies: [Zombie]) -> Bool {
    for zombie in zombies { 
      zombie.restoreAllDice()

      print("\n\n\n")
      print("===")
      printTableWithPoints(zombies: zombies) 
      print("Current turn: " + zombie.getName() + " 🧟")

      var points = 0
      var deadPoints = 0
      repeat {
        print("===")
        let chosenDices: [Dice] = zombie.chooseThreeDices()
        let rolledDices: [Dice] = zombie.rollDices(chosenDices: chosenDices)
        print("===")
        
        deadPoints += zombie.getShotguns(diceFaces: rolledDices)
        if deadPoints >= 3 {
          print("Zombie " + zombie.getName() + " is dead for this round. 💀")
          break
        }

        points += zombie.getBrains(diceFaces: rolledDices)

        if zombie.getPoints() + points >= 13 {
          print("Zombie " + zombie.getName() + " has won! 🏆 🏆 🏆")
          return true
        }

        let wantToContinue = waitForAnswer(question: "Do you want to continue?", expectedAnswers: ["Y", "N"])
        if wantToContinue == "N" {
          zombie.updatePoints(points: points)
          break
        }

        let steps: [Dice] = zombie.getSteps(diceFaces: rolledDices)
        if !steps.isEmpty {

          for dice in steps {
            let diceForReturning = waitForAnswer(question: "Do you want to return the " + dice.getTypeAsColor() + " dice?", expectedAnswers: ["Y", "N"])
            if diceForReturning == "Y" {
              zombie.addDices(dices: [dice])
            }
          }
          
        }

        if !zombie.hasDices() {
          print("Zombie " + zombie.getName() + " doesn't have enough dice")
          zombie.updatePoints(points: points)
          break
        }

      } while (true)
    }
    return false
  }

  func waitForAnswer(question: String, expectedAnswers: [String]) -> String {
    var expAnswers: String = "["
    for i in 0...expectedAnswers.count - 1 {
      if i == expectedAnswers.count - 1{
        expAnswers += expectedAnswers[i] + "]"
      } else {
        expAnswers += expectedAnswers[i] + "/"
      }
    }
    print(question + expAnswers)

    while (true) {
      if let answerFromClient = readLine() {
        for expectedAnswer in expectedAnswers {
          if answerFromClient.uppercased() == expectedAnswer.uppercased() {
            return expectedAnswer
          }
        }
        print("Please answer the question")
      } else {
        print("Please answer the question")
      }
    }
  }

  func printTableWithPoints(zombies: [Zombie]) {
    var longestNameCount = 4
    for zombie in zombies {
      if zombie.getName().count > longestNameCount {
        longestNameCount = zombie.getName().count
      }
    }

    var horizontalLines = " "
    for _ in 0...longestNameCount + 4 + 6 {
      horizontalLines += "-"
    }
    print(horizontalLines)

    var header = "| Name"
    for _ in 0...longestNameCount - 4 {
      header += " "
    }
    header += "| Points |"
    print(header)
    print(horizontalLines)

    for zombie in zombies {
      var zombieRow = "| " + zombie.getName()
      for _ in 0...longestNameCount - zombie.getName().count {
        zombieRow += " "
      }
      if String(zombie.getPoints()).count == 1 {
        zombieRow += "| " + String(zombie.getPoints()) + "      |"
      } else {
        zombieRow += "| " + String(zombie.getPoints()) + "     |"
      }
      
      print(zombieRow)
      print(horizontalLines)
    }
  }
}
