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

  func updatePoints(points: Int) {
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

  func rollDices(chosenDices: [Dice]) -> [DiceFace] {
    var rolledDice: [DiceFace] = []
    for dice in chosenDices {
      rolledDice.append(dice.roll())
    }
    print("After rolling " + name + " has " + rolledDice[0].toString() + " " + rolledDice[1].toString() + " " + rolledDice[2].toString())

    return rolledDice
  }

  func hasDices() -> Bool {
    return gameManager.getDicesCount() > 2
  }

  func getBrains(diceFaces: [DiceFace]) -> Int {
    var counter: Int = 0
    for diceFace in diceFaces {
      counter += diceFace.getPoint()
    }
    return counter
  }

  func getShotguns(diceFaces: [DiceFace]) -> Int {
    var counter: Int = 0
    for diceFace in diceFaces {
      if diceFace == .shotgun {
        counter += 1
      }
    }
    return counter
  }
}