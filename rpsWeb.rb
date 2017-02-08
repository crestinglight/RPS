
#Defining a new class called "Round". This will contain all of our information for each round of rock, paper, scissors, including which weapons were chosen, who won the round, and what the series score is at any given time during the round.
class Round

	#Just sets a variable of the series that we are in, passing the series information into the round.
	def setseries(series)
		@series = series
	end

	#This method decides who won the round. The information being passed in is which weapon player 1 and player 2 chose, whether the round was a tie, and who won so long as it is not a tie. The method then continues on to "addScore", which will add the player's win to the series score.
	def whoWon(p1weapon, p2weapon)

		if (p1weapon === p2weapon) && (p1weapon != nil) && (p2weapon != nil)
			@winResult = 0
			#startGame
			return @winResult
		end	

		if (p1weapon === "rock" && p2weapon === "scissors") || (p1weapon === "scissors" && p2weapon === "paper") || (p1weapon === "paper" && p2weapon === "rock")
			@winResult = 1
			addScore
			return @winResult
		end

		if (p2weapon === "rock" && p1weapon === "scissors") || (p2weapon === "scissors" && p1weapon === "paper") || (p2weapon === "paper" && p1weapon === "rock")
			@winResult = 2
			addScore
			return @winResult
		end
	end

	def winnerResult
		return @winResult
	end

	def addScore

		if @winResult == 1
			@series.incrementP1Score

		end

		if @winResult == 2
			@series.incrementP2Score
			
		end
	end

	def displayWinner
		if @winresult == 0
			return "It's a tie!"
		end
		if @winresult == 1
			return "Player 1 wins!"
		end
		if @winresult == 2
			return "Player 2 wins!"
		end
	end
end

class Series

	def setPlayer1Score
		@player1Score = 0
	end

	def setPlayer2Score
		@player2Score = 0
	end

	def incrementP1Score
		@player1Score += 1
	end

	def incrementP2Score
		@player2Score += 1
	end

	def player1Score
		return @player1Score
	end

	def player2Score
		return @player2Score
	end

	def p1

	def whoWonSeries
		if @player1Score == 3
			return 1
		end
		if @player2Score == 3
			return 2
		end
	end

	def gameOver
		whoWonSeries != nil
	end
end













