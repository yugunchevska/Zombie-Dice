final class Zombie {
  private var name: String
  private var points: Int
  private var gameManager: GameManager

  init(name: String) {
    self.name = name
    self.points = 0
    self.gameManager = GameManager()
  }

  func chooseThreeDices() {
    let dices = gameManager.chooseThreeDices()
    
    print(name + " chose dice of types " + dices[0].getType() + " " + dices[1].getType() + " " + dices[2].getType())
  }
}