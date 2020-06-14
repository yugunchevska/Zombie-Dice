let zombieOne = Zombie(name: "Yuliana")
let zombieTwo = Zombie(name: "Valentin")

var zombies: [Zombie] = [zombieOne, zombieTwo]

for zombie in zombies {
  // repeat
  let chosenDices: [Dice] = zombie.chooseThreeDices()
  let rolledDices: [Dice] = zombie.rollDices(chosenDices: chosenDices)
  
  var deadPoints = zombie.getShotguns(diceFaces: rolledDices)
  if deadPoints >= 3 {
    print("Zombie " + zombie.getName() + " is dead for this round.")
    continue
  }

  var points = zombie.getBrains(diceFaces: rolledDices)

  // ask to continue the game?

  let steps: [Dice] = zombie.getSteps(diceFaces: rolledDices)
  if steps.count != 0 {
    // ask for returning the dices with steps? 
    zombie.addDices(dices: steps)
  }

  if !zombie.hasDices() {
    print("Zombie " + zombie.getName() + " doesn't have enough dice")
    zombie.updatePoints(points: points)
    continue
  }



  // till here

  
  
  
  // repeat
  let chosenDicesTwo: [Dice] = zombie.chooseThreeDices()
  let rolledDicesTwo: [Dice] = zombie.rollDices(chosenDices: chosenDicesTwo)
  
  deadPoints += zombie.getShotguns(diceFaces: rolledDicesTwo)
  if deadPoints >= 3 {
    print("Zombie " + zombie.getName() + " is dead for this round.")
    continue
  }

  points += zombie.getBrains(diceFaces: rolledDicesTwo)

  if !zombie.hasDices() {
    print("Zombie " + zombie.getName() + " doesn't have enough dice")
    zombie.updatePoints(points: points)
    continue
  }

  // ask to continue the game?

  let stepsTwo: [Dice] = zombie.getSteps(diceFaces: rolledDices)
  if stepsTwo.count != 0 {
    // ask for returning the dices with steps? 
    zombie.addDices(dices: stepsTwo)
  }

  // till here

  // add this at the end
  zombie.updatePoints(points: points)
}