#!/bin/bash -x

printf "Welcome to Tic Tac Toe Game \n"

#Function for Fresh start for resetting Board
function resetBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )
	echo " ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo " ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo " ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}

#Function for Assign a Symbol and which player start first
function assignSymbol(){
	resetBoard
	Number=$(( RANDAM%2 ))
	if [[ $Number -eq 1 ]]
	then
		printf "Player got 'X' Symbol \n"
		printf "Player1 will start \n"
	else
		printf "Player got 'O' Symbol \n"
		printf "Player2 will start \n"
	fi
}

#Function for Display Gameboard
function displayBoard(){
	echo " |_ ${gameBoard[0]} _|_ ${gameBoard[1]} _|_ ${gameBoard[2]} _|"
	echo " |_ ${gameBoard[3]} _|_ ${gameBoard[4]} _|_ ${gameBoard[5]} _|"
	echo " |_ ${gameBoard[6]} _|_ ${gameBoard[7]} _|_ ${gameBoard[8]} _|"
}

#Function for giving CellInput
function givingCellInput(){
	count=0
	for(( position=1; position<9; position++ ))
	do
		read -p "Enter a CellInput:" Cell
		if [[ $gameBoard[$position] -eq $Cell ]]
		then
			gameBoard[ $(( $Cell - 1 )) ]='X'
			(( count++ ))
			displayBoard
		else
			printf "Can't Print on Index"
		fi
}

function Calculate(){
	while [[ $count != 9 ]]
	do
		assignSymbol
		givingCellInput
	done
}
Calculate
