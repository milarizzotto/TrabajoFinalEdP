#!/bin/bash

function descomprimir(){
	var1=$(md5sum $1 | grep -o "^[^ ]*")
	var2=$(cat $2 | grep -o "^[^ ]*")

	if [ "$var1" == "$var2" ]
	then
		unzip $1 -d ./imagenes/imgDescomprimidas
		rm -fr ./imagenes/imgDescomprimidas/imgDescomprimidas
	fi
}

descomprimir $1 $2
