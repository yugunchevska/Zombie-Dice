let zombieOne = Zombie(name: "Yuliana")
let zombieTwo = Zombie(name: "Valentin")

var zombies: [Zombie] = [zombieOne, zombieTwo]

for zombie in zombies {
  let chosenDices = zombie.chooseThreeDices()
  let rolledDices = zombie.rollDices(chosenDices: chosenDices)
  var points = zombie.getBrains(diceFaces: rolledDices)
  var deadPoints = zombie.getShotguns(diceFaces: rolledDices)
  if deadPoints >= 3 {
    print("Zombie " + zombie.getName() + " is dead for this round.")
    continue
  }

  if !zombie.hasDices() {
    print("Zombie " + zombie.getName() + " doesn't have enough dice")
    zombie.updatePoints(points: points)
    continue
  }

  let chosenDicesTwo = zombie.chooseThreeDices()
  let rolledDicesTwo = zombie.rollDices(chosenDices: chosenDicesTwo)
  points += zombie.getBrains(diceFaces: rolledDicesTwo)
  deadPoints += zombie.getShotguns(diceFaces: rolledDicesTwo)
  if deadPoints >= 3 {
    print("Zombie " + zombie.getName() + " is dead for this round.")
    continue
  }

  if !zombie.hasDices() {
    print("Zombie " + zombie.getName() + " doesn't have enough dice")
    zombie.updatePoints(points: points)
    continue
  }

  zombie.updatePoints(points: points)
}