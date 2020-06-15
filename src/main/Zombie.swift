final class Zombie {
  private var name: String
  private var points: Int
  private var diceManager: DiceManager

  init(name: String) {
    self.name = name
    self.points = 0
    self.diceManager = DiceManager()
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

  func resetPoints() {
    self.points = 0
  }
}

extension Zombie {
  func chooseThreeDices() -> [Dice] {
    let chosenDices = diceManager.chooseThreeDices()

    print(name + " chose dice of types " + chosenDices[0].getTypeAsColor() + ", " + chosenDices[1].getTypeAsColor() + ", " + chosenDices[2].getTypeAsColor())

    diceManager.removeDices(remove: chosenDices)
    return chosenDices
  }

  func rollDices(chosenDices: [Dice]) -> [Dice] {
    var rolledDice: [Dice] = []
    for dice in chosenDices {
      rolledDice.append(dice.roll())
    }
    print("After rolling " + name + " has " + rolledDice[0].getRolledFace().getFaceAsEmoji() + "  " + rolledDice[1].getRolledFace().getFaceAsEmoji() + "  " + rolledDice[2].getRolledFace().getFaceAsEmoji())

    return rolledDice
  }

  func hasDices() -> Bool {
    return diceManager.getDicesCount() > 2
  }

  func addDices(dices: [Dice]) {
    diceManager.addDices(add: dices)
  }

  func restoreAllDice() {
    diceManager.restoreAllDice()
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