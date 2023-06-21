#!/bin/bash

function generar(){
	if [ ! -e ./nombres/dict.csv ]
        then
        	wget -P ./nombres https://raw.githubusercontent.com/fernandezpablo85/name_suggestion
        fi
	for (( i=0; i<$1; i++ ))
	do
	numRandom=$(shuf -i 0-96000 -n 1)
	p='p'
	num="${numRandom}${p}"
	nombre=$(sed -n $num ./nombres/dict.csv | grep -o "^[^,]*" | sed 's/ /_/g')
	wget -P ./imagenes/ https://source.unsplash.com/random/900%C3%97700/?person
        mv ./imagenes/index.html?person ./imagenes/$nombre.jpeg
        sleep 1
	done
}
