var prompt = require('/Users/evingrost/Code/Rock-Paper-Scissors/node_modules/prompt');

prompt.start();

startGame();

function startGame(){

	console.log("Player 1, choose your weapon!");
	getPlayer1();
}

function getPlayer1(){

	prompt.get(['P1Weapon'], function (err, result) {
		
		var lowerP1Weapon = result.P1Weapon.toLowerCase();
		var isAnswerValid = checkValidity(lowerP1Weapon);
		if (isAnswerValid == true){
			console.log('Player 1, you chose ' + result.P1Weapon + '!');
			getPlayer2(lowerP1Weapon);
		}
		else {
			console.log("Your options are rock, paper, or scissors. Try again slugger.")
			getPlayer1();
		}
	});
}

function getPlayer2(p1weaponChoice){

	console.log("Player 2, choose your weapon!");
	prompt.get(['P2Weapon'], function (err, result) {
		var lowerP2Weapon = result.P2Weapon.toLowerCase();
		var isAnswerValid = checkValidity(lowerP2Weapon);
		if (isAnswerValid == true){
			console.log('Player 2, you chose ' + result.P2Weapon + '!');
			whoWon(p1weaponChoice, lowerP2Weapon);
		}
		else {
			console.log("Seriously, your only options are rock, paper, or scissors. Try again.");
			getPlayer2(p1weaponChoice);
		}
	});
}

function whoWon(p1weapon, p2weapon){

	if (p1weapon == p2weapon){
		console.log("It's a tie!");
	}	
	if ((p1weapon == "rock" && p2weapon == "scissors") || (p1weapon == "scissors" && p2weapon == "paper") || (p1weapon == "paper" && p2weapon == "rock")){
		console.log("Player 1 wins!!!");
	}
	if ((p2weapon == "rock" && p1weapon == "scissors") || (p2weapon == "scissors" && p1weapon == "paper") || (p2weapon == "paper" && p1weapon == "rock")){
		console.log("Player 2 wins!!!");
	}
}

function checkValidity(weapon){

	if (weapon == "rock" || weapon == "paper" || weapon == "scissors"){
		return true;
	}
	else {
		return false;
	}
}



