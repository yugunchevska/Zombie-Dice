let gameManager = GameManager()
let zombieOne = Zombie(name: "Yuliana")
let zombieTwo = Zombie(name: "Valentin")

var zombies: [Zombie] = [zombieOne, zombieTwo]

for zombie in zombies {
  let chosenDices = gameManager.chooseThreeDices(zombie: zombie)
  for dice in chosenDices {
    print(dice.roll().toString())
  }
}