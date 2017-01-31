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

	console.log('Player 2, you chose ' + result.P2Weapon + '!');
	checkValidity();
	whoWon();
	});
}

function whoWon(){

	console.log("You're all winners here!")
}

function checkValidity(weapon){

	if (weapon == "rock" || weapon == "paper" || weapon == "scissors"){
		return true;
	}
	else {
		return false;
	}
}



