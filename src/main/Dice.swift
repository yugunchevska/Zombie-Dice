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

  func getFaceAsEmoji() -> String {
    switch self {
      case .brain: return "🧠"
      case .steps: return "👣"
      case .shotgun: return "💥"
    }
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
  private var rolledFace: DiceFace?

  init(type: DiceType) {
    self.type = type
    self.rolledFace = nil
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

  func getTypeAsColor() -> String {
    switch type {
      case .green: 
        return "\u{001B}[0;32m" + getType().uppercased() + "\u{001B}[0;0m"
      case .yellow:
        return "\u{001B}[0;33m" + getType().uppercased() + "\u{001B}[0;0m"
      case .red: 
        return "\u{001B}[0;31m" + getType().uppercased() + "\u{001B}[0;0m"
    }

  }

  func getRolledFace() -> DiceFace {
    return rolledFace!
  }

  func roll() -> Dice {
    let faceIndex = Int.random(in: 1...6)
    switch type {
      case .green:
        switch faceIndex {
          case 1...3: 
            self.rolledFace = .brain
          case 4,5:
            self.rolledFace = .steps
          case 6:
            self.rolledFace = .shotgun
          default:
            self.rolledFace = .brain
        }

      case .yellow:
        switch faceIndex {
          case 1,2: 
            self.rolledFace = .brain
          case 3,4:
            self.rolledFace = .steps
          case 5,6:
            self.rolledFace = .shotgun
          default:
            self.rolledFace = .steps
        }
      case .red: 
        switch faceIndex {
          case 1: 
            self.rolledFace = .brain
          case 2,3:
            self.rolledFace = .steps
          case 4...6:
            self.rolledFace = .shotgun
          default:
            self.rolledFace = .shotgun
        }
    }
    return self
  }
}