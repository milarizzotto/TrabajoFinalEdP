#!/bin/bash

function descomprimir(){
	var1=$(md5sum $1 | grep -o "^[^ ]*")
	var2=$(cat $2 | grep -o "^[^ ]*")

	if [ "$var1" == "$var2" ]
	then
		unzip $1 -d ./datasets/imagenes/imgDescomprimidas
		rm ./datasets/imagenes/imgcomprimidas.zip
		rm ./datasets/imagenes/suma_verificacion.txt
	fi
}

