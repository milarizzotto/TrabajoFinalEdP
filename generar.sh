#!/bin/bash

function generar(){
	echo "$1"
	for (( i=0; i<$1; i++ ))
	do
	wget -P ./imagenes https://source.unsplash.com/random/900%C3%97700/?person
	sleep 2
	done
}
