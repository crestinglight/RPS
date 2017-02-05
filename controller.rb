require_relative 'rpsWeb.rb'
require 'sinatra'
require 'pry'

get("/"){
	erb :homepage
}

post("/"){
	p1Choice = params["weapon1"]
	p2Choice = params["weapon2"]
	winner = whoWon(p1Choice, p2Choice)
	if ($player1Score == 3) || ($player2Score == 3)
		redirect("/winner")
	else
	redirect("/roundwin?roundwinner=#{winner}")
	end
	erb :homepage
}

get("/roundwin"){
	@printwinner = params.values[0]
	@currentP1Score = $player1Score.to_s
	@currentP2Score = $player2Score.to_s

	erb :roundwin
}

post("/roundwin"){
	erb :roundwin
}

get("/winner"){
	erb :winner
}

