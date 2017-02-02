#Start game def. Starts by telling player 1 to choose a weapon, then moves on to get their input.
def startGame
	###
	puts "GAME STARTS NOW."
	###

	puts "Player 1, choose your weapon!"
	getPlayer1
end

#Gets player 1's input. Checks the validity of their answer. If the answer is valid, moves on to player 2. If not, tells them their options and restarts the def.
def getPlayer1

	p1weapon = gets.chomp

	###
	puts "Player 1 typed in exactly: " + p1weapon
	###
		
	lowerP1Weapon = p1weapon.downcase

	###
	puts "player 1 weapon lowercase = " + lowerP1Weapon
	###

	isAnswerValid = checkValidity(lowerP1Weapon)

	###
	puts "Is answer valid? = " + isAnswerValid.to_s
	###

	if isAnswerValid === true
		###
		puts "Okay, the answer is valid, now we confirm the player 1 weapon choice."
		###
		puts "Player 1, you chose " + lowerP1Weapon + "."
		getPlayer2(lowerP1Weapon)

	else 
		puts "Wrong answer, try again."

		###
		puts "Now we start the game over."
		###
		startGame
	end
end

#Gets player 2's input. Calls to check the validity of the answer. If the answer is valid, moves on to decide who won. If not, tells them their options and restarts the def.
def getPlayer2(p1weaponChoice)

	###
	puts "Now in getPlayer2 function. Prompts for Player 2 weapon."
	###

	puts "Player 2, choose your weapon!"
	p2weapon = gets.chomp

	###
	puts "Player 2 typed in exactly: " + p2weapon
	###

	lowerP2Weapon = p2weapon.downcase

	###
	puts "Player 2 weapon lowercase = " + lowerP2Weapon.to_s
	###

	isAnswerValid = checkValidity(lowerP2Weapon)

	###
	puts "Is player 2 answer valid? = " + isAnswerValid.to_s
	###

	if isAnswerValid === true
		###
		puts "Okay, the answer is valid, now we confirm the player 2 weapon choice."
		###

		puts "Player 2, you chose " + lowerP2Weapon + "."

		###
		puts "Now we'll figure out who won this round, and move on to the whoWon function."
		###
		whoWon(p1weaponChoice, lowerP2Weapon)

	else
		puts "Wrong answer, try again."

		###
		puts "The answer was invalid, so now we restart the getPlayer2 function, but keep player 1's choice."
		###
		getPlayer2(p1weaponChoice)
	end
end

#def which looks at the choices the players made and determines a winner. If they chose the same, they tied!
def whoWon(p1weapon, p2weapon)

	###
	puts "We are now in the whoWon function."
	###

	if p1weapon === p2weapon
		###
		puts "If you're seeing this, it's because players 1 and 2 both picked the same weapon."
		###

		winnerResult = "It's a tie!"
		puts(winnerResult)
		puts "The score is currently " + $player1Score.to_s + " to " + $player2Score.to_s + "."

		###
		puts "Now we restart the game, starting a new round."
		###

		startGame
		return winnerResult
	end	

	if (p1weapon === "rock" && p2weapon === "scissors") || (p1weapon === "scissors" && p2weapon === "paper") || (p1weapon === "paper" && p2weapon === "rock")
		###
		puts "If you're seeing this, it's because player 1 won the round."
		###

		winnerResult = "Player 1 wins!!!"
		puts(winnerResult)

		###
		puts "Now we are about to move on to the addScore function, and update the total score for the game thus far."
		###
		addScore(winnerResult)
		return winnerResult
	end

	if (p2weapon === "rock" && p1weapon === "scissors") || (p2weapon === "scissors" && p1weapon === "paper") || (p2weapon === "paper" && p1weapon === "rock")
		###
		puts "If you're seeing this, it's because player 2 won the round."
		###
		winnerResult = "Player 2 wins!!!"
		puts(winnerResult)

		###
		puts "Now we are about to move on to the addScore function, and update the total score for the game thus far."
		###

		addScore(winnerResult)
		return winnerResult
	end
end

#Checks the validity of the players' answers. If they didn't type in rock, paper, or scissors, returns an invalid answer.
def checkValidity(weapon)
	lowerWeapon = weapon.downcase

	if lowerWeapon === "rock" || lowerWeapon === "paper" || lowerWeapon === "scissors"
		return true

	else
		return false
	end
end

def addScore(winResult)

	###
	puts "We are now in the addScore function."
	###

	if winResult == "Player 1 wins!!!"

		###
		puts "Player 1 won, we are about to add player 1's win to player 1's total score. It currently equals " + $player1Score.to_s
		###
		$player1Score = $player1Score + 1

		###
		puts "The score now equals: " + $player1Score.to_s
		###

		###
		puts "Now we move on to keepScore function."
		###
		keepScore

	end

	if winResult == "Player 2 wins!!!"

		###
		puts "Player 2 won, we are about to add player 2's win to player 2's total score. It currently equals " + $player2Score.to_s
		###

		$player2Score = $player2Score + 1

		###
		puts "The score now equals: " + $player2Score.to_s
		###

		###
		puts "Now we move on to keepScore function."
		###

		keepScore
	end
end

def p1Wins

	###
	puts "Here's where we start looping. Why though???"
	###

	p2score = $player2Score.to_s

	###
	puts "Converting player 2's score to a string."
	###

	puts "Player 1 won, with a score of 5 to " + p2score + "!"
end

def p2Wins

	###
	puts "Here's where we start looping. Why though???"
	###

	p1score = $player1Score.to_s
	
	###
	puts "Converting player 1's score to a string."
	###

	puts "Player 2 won, with a score of 5 to " + p1score + "!"
end

def keepScore
	
	if $player1Score < 5 && $player2Score < 5
		###
		puts "If both player scores are less than 5, you will see this message."
		###
		puts "The score is currently " + $player1Score.to_s + " to " + $player2Score.to_s + "."

		###
		puts "Now we start a new round."
		###
		startGame
	end

	if $player1Score === 5 && $player2Score < 5
		###
		puts "If Player 1's score = 5, and player 2's score is less than 5, you will see this."
		###
		p1Wins
		###
		puts "Now we move on to the p1Wins function, where we will print the win."
		###

	end

	if $player1Score < 5 && $player2Score === 5
		###
		puts "If Player 2's score = 5, and player 1's score is less than 5, you will see this."
		###
		
		p2Wins

		###
		puts "Now we move on to the p1Wins function, where we will print the win."
		###
	end
end

$player1Score = 0
###
puts "Player 1's score starts at 0."
###

$player2Score = 0
###
puts "Player 2's score starts at 0."
###

#Begins the def that runs the program, starting the game.
startGame