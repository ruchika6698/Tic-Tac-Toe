#!/bin/bash -x

printf "Welcome to Tic Tac Toe Game \n"

for (( position=1; position<=9; position++ ))
do
	gameBoard[$position]=$position
done
echo ${gameBoard[@]}
