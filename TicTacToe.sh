#!/bin/bash -x

printf "Welcome to Tic Tac Toe Game \n"
TRUE=1
FALSE=0
POSITIVE=2

#variable
count=0
turn=" "

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
		printf "Player got 'X' Symbol and player will start first \n"
	else
		printf "Player got 'O' Symbol and Computer will start first \n"
	fi
}

#Function for Display Gameboard
function displayBoard(){
	echo " |_ ${gameBoard[0]} _|_ ${gameBoard[1]} _|_ ${gameBoard[2]} _|"
	echo " |_ ${gameBoard[3]} _|_ ${gameBoard[4]} _|_ ${gameBoard[5]} _|"
	echo " |_ ${gameBoard[6]} _|_ ${gameBoard[7]} _|_ ${gameBoard[8]} _|"
}

#function to check sides
function checkSides(){
	flag=0
	if [[ ${gameBoard[$(($position))]} != "X" && ${gameBoard[$(($position))]} != "O" ]]
	then
		Number1=$((${gameBoard[$position]}%2))
		if [[ $Number1 -eq 0 ]]
		then
			flag=1
			echo  ${gameBoard[$(($position))]}
		fi
	fi
}


#Function to check Center position
function checkCenter(){
	flag=0
	position=0
	if [[ ${gameBoard[$(($position+4))]} != "X" && ${gameBoard[$(($position+4))]} != "O" ]]
	then
		echo  ${gameBoard[$(($position+4))]}
	else
		sides=$( checkSides )
		printf "$sides \n"
	fi
}


#function to check at corner
function checkCorner(){
	flag=0
	number=$((${gameBoard[$position]}%2))
	if [[ $number -eq 1 ]] && [[ ${gameBoard[$position]} -ne 5 ]]
	then
		flag=1
		echo "${gameBoard[position]}"
		break
	fi
	if [[ $flag -eq 0 ]]
	then
		center=$( $checkCenter )
		printf "$center \n"
	fi
}



#If opponent is winning then block opponent
function checkopponent(){
	flag=0
	for (( position=0; position<=8; position++ ))
	do
		if [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+1)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+2))]}
			break
		elif  [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+2)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+1))]}
			break
		elif [[ ${gameBoard[$position+1]} -eq "X" && ${gameBoard[ $(($position+2)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position))]}
			break
		elif  [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+3)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+6))]}
			break
		elif [[ ${gameBoard[$position+3]} -eq "X" && ${gameBoard[ $(($position+6)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position))]}
			break
		elif  [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+6)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+3))]}
			break
		elif [[ ${gameBoard[$position+2]} -eq "X" && ${gameBoard[ $(($position+6)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+4))]}
			break
		elif  [[ ${gameBoard[$position+2]} -eq "X" && ${gameBoard[ $(($position+4)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+6))]}
			break
		elif [[ ${gameBoard[$position+4]} -eq "X" && ${gameBoard[ $(($position+6)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+2))]}
			break
		elif [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+5)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+8))]}
			break
		elif  [[ ${gameBoard[$position]} -eq "X" && ${gameBoard[ $(($position+8)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position+5))]}
			break
		elif [[ ${gameBoard[$position+5]} -eq "X" && ${gameBoard[ $(($position+8)) ]} -eq "X" ]]
		then
			flag=1
			echo ${gameBoard[$(($position))]}
			break
		fi
	done
	if [[ $flag -eq 0 ]]
	then
		corner=$( checkCorner )
		printf "$corner \n"
	fi
}

#function for player1 input
function givingCellInput(){
	printf "User \n"
	read -p "enter cell number:" Cell
	for((position=0; position<=8; position++))
  	do
		if [[ ${gameBoard[$position]} -eq $Cell ]]
		then
			gameBoard[$(($Cell-1))]="X"
			(( count++ ))
			displayBoard
		fi
		turn="Computer"
	done
}

#Function for player2 input
function givingComputerInput(){
	printf "Computer \n"
	Cell=$((RANDOM%9+1))
	for((position=0; position<=8; position++))
	do
		if [[ ${gameBoard[$position]} -eq $Cell ]]
		then
			gameBoard[$(($Cell-1))]="O"
			(( counter++ ))
			turn="User"
			displayBoard
			break
		fi
		turn="Computer"
	done
}

#Function for checking Winning Condition rowwise
function CheckingForRows(){
	temp1=0
	for(( position=1; position<9; position++ ))
	do
		if [[ ${gameBoard[$position]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+1)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+2)) ]} -eq 'X' ]]
		then
			temp1=$TRUE
			break
		elif [[ ${gameBoard[$position]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+1)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+2)) ]} -eq 'O' ]]
		then
			temp1=$POSITIVE
			break
		elif [[ ${gameBoard[$position+3]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+5)) ]} -eq 'X' ]]
		then
			temp2=$TRUE
			break
		elif [[ ${gameBoard[$position+3]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+5)) ]} -eq 'O' ]]
		then
			temp2=$POSITIVE
			break
		elif [[ ${gameBoard[$position+6]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+7)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'X' ]]
		then
			temp2=$TRUE
			break
		elif [[ ${gameBoard[$position+6]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+7)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'O' ]]
		then
			temp2=$POSITIVE
			break
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
		if [[ ${gameBoard[$position]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+3)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+6)) ]} -eq 'X' ]]
		then
			temp2=$TRUE
			break
		elif [[ ${gameBoard[$position]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+3)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+6)) ]} -eq 'O' ]]
		then
			temp2=$POSITIVE
			break
		elif [[ ${gameBoard[$position+1]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+7)) ]} -eq 'X' ]]
		then
			temp2=$TRUE
			break
		elif [[ ${gameBoard[$position+1]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+7)) ]} -eq 'O' ]]
		then
			temp2=$POSITIVE
			break
		elif [[ ${gameBoard[$position+2]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+5)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'X' ]]
		then
			temp2=$TRUE
			break
		elif [[ ${gameBoard[$position+2]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+5)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'O' ]]
		then
			temp2=$POSITIVE
			break
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
		if [[ ${gameBoard[$position]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'X' ]]
		then
			temp3=$TRUE
			break
		elif [[ ${gameBoard[$position+2]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'X' ]] && [[ ${gameBoard[ $(($position+6)) ]} -eq 'X' ]]
		then
			temp3=$TRUE
			break
		elif [[ ${gameBoard[$position]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+8)) ]} -eq 'O' ]]
		then
			temp3=$POSITIVE
			break
		elif [[ ${gameBoard[$position+2]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+4)) ]} -eq 'O' ]] && [[ ${gameBoard[ $(($position+6)) ]} -eq 'O' ]]
		then
			temp3=$POSITIVE
			break
		else
			temp3=$FALSE
		fi
	done
	printf "$temp3 \n"
}

#function for playing game
function playing(){
	assignSymbol
	while [[ $count != 9 ]]
	do
		givingCellInput
		if [[ $turn -eq Computer ]]
		then
			givingComputerInput
		else
			givingCellInput
		fi
		a=$( CheckingForRows )
		b=$( CheckingForCoulmns )
		c=$( CheckingForDiagonally )
		if [[ $a -eq 1 ]] || [[ $b -eq 1 ]] || [[ $c -eq 1 ]]
		then
			printf "Player Win \n"
			break
		elif [[ $a -eq 2 ]] || [[ $b -eq 2 ]] || [[ $c -eq 2 ]]
		then
			printf "Computer Win \n"
			break
		else
			printf "Match is Tie \n"
		fi
	done
}
playing
