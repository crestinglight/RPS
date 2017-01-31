var prompt = require('/Users/evingrost/Code/Rock-Paper-Scissors/node_modules/prompt');

//Starts the prompting library.
prompt.start();

//Begins the function that runs the program, starting the game.
startGame();

//Start game function. Starts by telling player 1 to choose a weapon, then moves on to get their input.
function startGame(){

	console.log("Player 1, choose your weapon!");
	getPlayer1();
}

//Gets player 1's input. Checks the validity of their answer. If the answer is valid, moves on to player 2. If not, tells them their options and restarts the function.
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

//Gets player 2's input. Calls to check the validity of the answer. If the answer is valid, moves on to decide who won. If not, tells them their options and restarts the function.
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

//Function which looks at the choices the players made and determines a winner. If they chose the same, they tied!
function whoWon(p1weapon, p2weapon){

	if (p1weapon == p2weapon){
		var winnerResult = "It's a tie!"
		console.log(winnerResult);
		return winnerResult;
	}	
	if ((p1weapon == "rock" && p2weapon == "scissors") || (p1weapon == "scissors" && p2weapon == "paper") || (p1weapon == "paper" && p2weapon == "rock")){
		var winnerResult = "Player 1 wins!!!"
		console.log(winnerResult);
		return winnerResult;
	}
	if ((p2weapon == "rock" && p1weapon == "scissors") || (p2weapon == "scissors" && p1weapon == "paper") || (p2weapon == "paper" && p1weapon == "rock")){
		var winnerResult = "Player 2 wins!!!"
		console.log(winnerResult);
		return winnerResult;
	}
}

//Checks the validity of the players' answers. If they didn't type in rock, paper, or scissors, returns an invalid answer.
function checkValidity(weapon){

	if (weapon == "rock" || weapon == "paper" || weapon == "scissors"){
		return true;
	}
	else {
		return false;
	}
}

// testWinner();
// function testWinner(){

// 	var actual = whoWon("rock", "scissors");
// 	var expected = "Player 1 wins!!!"
// 	if (actual == expected){
// 		console.log("Pass.");
// 	}
// 	else{
// 		console.log("Fail. I expected " + expected + ", I got " + actual);
// 	}
// }









