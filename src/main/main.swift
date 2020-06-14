let gameManager = GameManager()
let zombieOne = Zombie(name: "Yuliana")
let zombieTwo = Zombie(name: "Valentin")

var zombies: [Zombie] = [zombieOne, zombieTwo]

for zombie in zombies {
  let _ = gameManager.chooseThreeDices(zombie: zombie)
  // dice.roll()
}