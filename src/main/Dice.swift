enum DiceType {
  case green
  case yellow
  case red
}

final class Dice {
  private var type: DiceType
  private var brainFaces: Int
  private var stepsFaces: Int
  private var shotgunFaces: Int

  init(type: DiceType) {
    self.type = type
    switch self.type {
      case .green:
        brainFaces = 3
        stepsFaces = 2
        shotgunFaces = 1
      case .yellow:
        brainFaces = 2
        stepsFaces = 2
        shotgunFaces = 2
      case .red:
        brainFaces = 1
        stepsFaces = 2
        shotgunFaces = 3
    } 
  }

  func getType() -> String {
    return String(describing: type)
  }
}