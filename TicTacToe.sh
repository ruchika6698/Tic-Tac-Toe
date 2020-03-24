#!/bin/bash -x

printf "Welcome to Tic Tac Toe Game \n"

function resetBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )
	echo " ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo " ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo " ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}

function assignSymbol(){
	resetBoard
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		printf "Player got 'X' Symbol \n"
	else
		printf "Player got 'O' Symbol \n"
	fi
}
assignSymbol
