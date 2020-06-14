enum DiceType {
  case green
  case yellow
  case red
}

enum DiceFace {
  case brain
  case steps
  case shotgun 

  func toString() -> String {
    return String(describing: self)
  }

  func getPoint() -> Int {
    switch self {
      case .brain: return 1
      case .steps: return 0
      case .shotgun: return 0
    }
  }
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

  func roll() -> DiceFace {
    let faceIndex = Int.random(in: 1...6)
    switch type {
      case .green:
        switch faceIndex {
          case 1...3: 
            return .brain
          case 4,5:
            return .steps
          case 6:
            return .shotgun
          default:
            return .brain
        }

      case .yellow:
        switch faceIndex {
          case 1,2: 
            return .brain
          case 3,4:
            return .steps
          case 5,6:
            return .shotgun
          default:
            return .steps
        }
      case .red: 
        switch faceIndex {
          case 1: 
            return .brain
          case 2,3:
            return .steps
          case 4...6:
            return .shotgun
          default:
            return .shotgun
        }
    }

  }
}