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

  func chooseThreeDices(zombie: Zombie) -> [Dice] {
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

    print(zombie.getName() + " chose dice of types " + chosenDices[0].getType() + " " + chosenDices[1].getType() + " " + chosenDices[2].getType())

    return chosenDices
  }

  private func random(without: [Int]) -> Int {
    var randomNumber = 99
    repeat {
      randomNumber = Int.random(in: 0...12)
    } while without.contains(randomNumber)
    
    return randomNumber
  }
}