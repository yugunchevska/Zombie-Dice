// initialize dices
var dices: [Dice] = []
for _ in 0...5 {
  dices.append(Dice(type: DiceType.green))
}
for _ in 0...3 {
  dices.append(Dice(type: DiceType.yellow))
}
for _ in 0...2 {
  dices.append(Dice(type: DiceType.red))
}
