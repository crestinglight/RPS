require_relative 'rpsWeb.rb'
require 'sinatra'
require 'pry'
enable :sessions

get("/"){
	if session["series"] == nil
		session["series"] = Series.new
		session["series"].setPlayer1Score
		session["series"].setPlayer2Score
	end
	erb :homepage
}

post("/"){
	p1Choice = params["weapon1"]
	p2Choice = params["weapon2"]
	session["round"] = Round.new
	session["round"].setseries(session["series"])
	session["round"].whoWon(p1Choice, p2Choice)
	if session["series"].gameOver
		redirect("/winner")
	else
		redirect("/roundwin?roundwinner=#{session["round"].winnerResult}")
	end
	erb :homepage
}


get("/roundwin"){
	@printwinner = session["round"].displayWinner
	@currentP1Score = session["series"].player1Score
	@currentP2Score = session["series"].player2Score

	erb :roundwin
}

post("/roundwin"){
	erb :roundwin
}

get("/winner"){
	@winner = session["series"].whoWonSeries
	session["series"] = nil
	erb :winner
}

