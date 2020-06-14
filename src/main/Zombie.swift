final class Zombie {
  private var name: String
  private var points: Int
  private var gameManager: GameManager

  init(name: String) {
    self.name = name
    self.points = 0
    self.gameManager = GameManager()
  }

  func getName() -> String {
    return name
  }

  func getPoints() -> Int {
    return points
  }

  func updatePoints(points: Int) {
    print("Zombie " + name + " won " + String(points) + " brains in this round.")
    self.points += points
  }
}

extension Zombie {
  func chooseThreeDices() -> [Dice] {
    let chosenDices = gameManager.chooseThreeDices()

    print(name + " chose dice of types " + chosenDices[0].getType() + " " + chosenDices[1].getType() + " " + chosenDices[2].getType())

    gameManager.removeDices(remove: chosenDices)
    return chosenDices
  }

  func rollDices(chosenDices: [Dice]) -> [Dice] {
    var rolledDice: [Dice] = []
    for dice in chosenDices {
      rolledDice.append(dice.roll())
    }
    print("After rolling " + name + " has " + rolledDice[0].getRolledFace().toString() + " " + rolledDice[1].getRolledFace().toString() + " " + rolledDice[2].getRolledFace().toString())

    return rolledDice
  }

  func hasDices() -> Bool {
    return gameManager.getDicesCount() > 2
  }

  func addDices(dices: [Dice]) {
    gameManager.addDices(add: dices)
  }
}

extension Zombie {
  func getBrains(diceFaces: [Dice]) -> Int {
    var counter: Int = 0
    for diceFace in diceFaces {
      counter += diceFace.getRolledFace().getPoint()
    }
    return counter
  }

  func getShotguns(diceFaces: [Dice]) -> Int {
    var counter: Int = 0
    for diceFace in diceFaces {
      if diceFace.getRolledFace() == .shotgun {
        counter += 1
      }
    }
    return counter
  }

  func getSteps(diceFaces: [Dice]) -> [Dice] {
    var stepsDice: [Dice] = []
    for dice in diceFaces {
      if dice.getRolledFace() == .steps {
        stepsDice.append(dice)
      }
    }
    return stepsDice
  }
}