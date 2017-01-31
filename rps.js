var prompt = require('/Users/evingrost/Code/Rock-Paper-Scissors/node_modules/prompt');

startGame;

prompt.start();

prompt.get(['P1Weapon'], function (err, result) {

	
	
	
});

function startGame(){

	console.log("Player 1, choose your weapon!");
	getPlayer1();
}

function getPlayer1(){

	prompt.get(['P1Weapon'], function (err, result) {
		console.log('Player 1, you chose ' + result.P1Weapon + '!');
	});
	getPlayer2();
}

function getPlayer2(){

	console.log("Player 2, choose your weapon!");
	prompt.get(['P2Weapon'], function (err, result) {

	console.log('Player 2, you chose ' + result.P2Weapon + '!');
	});
	whoWon();
}

function whoWon(){

	console.log("You're all winners here!")
}