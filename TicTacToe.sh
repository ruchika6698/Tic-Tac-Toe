#!/bin/bash -x

printf "Welcome to Tic Tac Toe Game \n"
TRUE=1
FALSE=0

#Function for Fresh start for resetting Board
function resetBoard(){
	gameBoard=( 1 2 3 4 5 6 7 8 9 )
	echo " ${gameBoard[0]} ${gameBoard[1]} ${gameBoard[2]} "
	echo " ${gameBoard[3]} ${gameBoard[4]} ${gameBoard[5]} "
	echo " ${gameBoard[6]} ${gameBoard[7]} ${gameBoard[8]} "
}

#function for Assign a Symbol and which player start first
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


function givingCellInput(){
	count=0
	read -p "enter cell number:" Cell
	gameBoard[$(($Cell-1))]="X"
	(( count++ ))
	displayBoard

}

#Function for checking Winning Condition rowwise
function CheckingForRows(){
	temp1=0
	for(( position=1; position<9; position++ ))
	do
		if [ ${gameBoard[$position]} -eq 'X' ] && [ ${gameBoard[ $(($position+1)) ]} -eq 'X' ] && [ ${gameBoard[ $(($position+2)) ] -eq 'X' ]
		then
			temp1=$TRUE
		else
			temp1=$FALSE
		fi
	done
	printf "$temp1 \n"
}

#Function for checking Winning Condition Coulmnwise
function CheckingForCoulmns(){
   temp2=0
   for(( position=1; position<9; position++ ))
   do
      if [ ${gameBoard[$position]} -eq 'X' ] && [ ${gameBoard[ $(($position+3)) ]} -eq 'X' ] && [ ${gameBoard[ $(($position+6)) ] -eq 'X' ]
      then
         temp2=$TRUE
      else
         temp2=$FALSE
      fi
   done
   printf "$temp2 \n"
}

#Function for checking Winning Condition diagonally
function CheckingForDiagonally(){
   temp3=0
   for(( position=1; position<9; position++ ))
   do
      if [ ${gameBoard[$position]} -eq 'X' ] && [ ${gameBoard[ $(($position+4)) ]} -eq 'X' ] && [ ${gameBoard[ $(($position+8)) ] -eq 'X' ]
      then
         temp3=$TRUE
		elif [ ${gameBoard[$position+2]} -eq 'X' ] && [ ${gameBoard[ $(($position+4)) ]} -eq 'X' ] && [ ${gameBoard[ $(($position+6)) ] -eq 'X' ]
      then
			temp3=$TRUE
		else
         temp3=$FALSE
      fi
   done
   printf "$temp3 \n"
}


function Calculate(){
	assignSymbol
	while [[ $count != 9 ]]
	do
		givingCellInput
		a=$( CheckingForRows )
		b=$( CheckingForCoulmns )
		c=$( CheckingForDiagonally )
		if [ $a -eq 1 ] || [ $b -eq 1 ] || [ $c -eq 1 ]
		then
			printf "You Win \n"
			break
		fi
	done
}
Calculate
