final class GameManager {
  private var dices: [Dice] = []

  init() {
    for _ in 0...5 {
      dices.append(Dice(type: DiceType.green))
    }
    for _ in 0...3 {
      dices.append(Dice(type: DiceType.yellow))
    }
    for _ in 0...2 {
      dices.append(Dice(type: DiceType.red))
    }
  }

  func getDicesCount() -> Int {
    return dices.count
  }

  func chooseThreeDices() -> [Dice] {
    var chosenDices: [Dice] = []
    var chosenIndexes: [Int] = []

    var index = random(without: chosenIndexes)
    var dice = dices[index]
    chosenDices.append(dice)
    chosenIndexes.append(index)

    index = random(without: chosenIndexes)
    dice = dices[index]
    chosenDices.append(dice)
    chosenIndexes.append(index)

    index = random(without: chosenIndexes)
    dice = dices[index]
    chosenDices.append(dice)
    chosenIndexes.append(index)

    return chosenDices
  }

  private func random(without: [Int]) -> Int {
    var randomNumber = 99
    repeat {
      randomNumber = Int.random(in: 0...dices.count - 1)
    } while without.contains(randomNumber)
    
    return randomNumber
  }
}

extension GameManager {
  private func removeDice(remove: Dice) {
    var indexToRemove = 0
    for i in 0...dices.count - 1 {
      if dices[i].getType() == remove.getType() {
        indexToRemove = i
        break
      }
    }
    dices.remove(at: indexToRemove)
  }

  func removeDices(remove: [Dice]) {
    for dice in remove {
      removeDice(remove: dice)
    }
  }

  func addDices(add: [Dice]) {
    dices.append(contentsOf: add)
  }
}