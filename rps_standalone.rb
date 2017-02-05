#Start game def. Starts by telling player 1 to choose a weapon, then moves on to get their input.
def startGame
	puts "Player 1, choose your weapon!"
	getPlayer1
end

#Gets player 1's input. Checks the validity of their answer. If the answer is valid, moves on to player 2. If not, tells them their options and restarts the def.
def getPlayer1

	p1weapon = gets.chomp
		
	lowerP1Weapon = p1weapon.downcase
	isAnswerValid = checkValidity(lowerP1Weapon)
	if isAnswerValid === true
		puts "Player 1, you chose " + lowerP1Weapon + "."
		getPlayer2(lowerP1Weapon)

	else 
		puts "Wrong answer, try again."
		startGame
	end
end

#Gets player 2's input. Calls to check the validity of the answer. If the answer is valid, moves on to decide who won. If not, tells them their options and restarts the def.
def getPlayer2(p1weaponChoice)

	puts "Player 2, choose your weapon!"
	p2weapon = gets.chomp
	lowerP2Weapon = p2weapon.downcase
	isAnswerValid = checkValidity(lowerP2Weapon)
	if isAnswerValid === true
		puts "Player 2, you chose " + lowerP2Weapon + "."
		whoWon(p1weaponChoice, lowerP2Weapon)

	else
		puts "Wrong answer, try again."
		getPlayer2(p1weaponChoice)
	end
end

#def which looks at the choices the players made and determines a winner. If they chose the same, they tied!
def whoWon(p1weapon, p2weapon)

	if p1weapon === p2weapon
		winnerResult = "It's a tie!"
		puts(winnerResult)
		puts "The score is currently " + $player1Score.to_s + " to " + $player2Score.to_s + "."
		startGame
		return winnerResult
	end	

	if (p1weapon === "rock" && p2weapon === "scissors") || (p1weapon === "scissors" && p2weapon === "paper") || (p1weapon === "paper" && p2weapon === "rock")
		winnerResult = "Player 1 wins!!!"
		puts(winnerResult)
		addScore(winnerResult)
		return winnerResult
	end

	if (p2weapon === "rock" && p1weapon === "scissors") || (p2weapon === "scissors" && p1weapon === "paper") || (p2weapon === "paper" && p1weapon === "rock")
		winnerResult = "Player 2 wins!!!"
		puts(winnerResult)
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

	if winResult == "Player 1 wins!!!"
		$player1Score = $player1Score + 1
		keepScore

	end

	if winResult == "Player 2 wins!!!"
		$player2Score = $player2Score + 1
		keepScore
	end
end

def p1Wins
	p2score = $player2Score.to_s
	puts "Player 1 won, with a score of 5 to " + p2score + "!"
end

def p2Wins
	p1score = $player1Score.to_s
	#p2score = $player2Score.to_s
	puts "Player 2 won, with a score of 5 to " + p1score + "!"
end

def keepScore
	
	if $player1Score < 5 && $player2Score < 5
		puts "The score is currently " + $player1Score.to_s + " to " + $player2Score.to_s + "."
		startGame

	elsif $player1Score === 5 && $player2Score < 5
		p1Wins

	elsif $player1Score < 5 && $player2Score === 5
		p2Wins
	end
end

$player1Score = 0
$player2Score = 0

#Begins the def that runs the program, starting the game.
startGame