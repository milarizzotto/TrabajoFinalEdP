#!/bin/bash

function generar(){

	if [ ! -e ./datasets/nombres/dict.csv ]
        then
        	wget -P ./datasets/nombres  https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
        fi
	
	rm -fr ./datasets/imagenes
	
	for (( i=0; i<$1; i++ ))
	do
	numRandom=$(shuf -i 0-96000 -n 1)
	p='p'
	num="${numRandom}${p}"
	nombre=$(sed -n $num ./datasets/nombres/dict.csv | grep -o "^[^,]*" | sed 's/ /_/g')
	wget -P ./datasets/imagenes/ https://source.unsplash.com/random/900%C3%97700/?person
        mv ./datasets/imagenes/index.html?person ./datasets/imagenes/$nombre.jpeg
        sleep 1
	done
	cd ./datasets/imagenes
	zip imgcomprimidas *
	rm *.jpeg
	md5sum imgcomprimidas.zip > suma_verificacion.txt
	cd ../..
}
