#!/bin/bash

function procesar(){

	cd ./datasets/imagenes/imgDescomprimidas
	ls -1 | grep ^[A-Z][a-z].*  > prueba.txt
	ls -1 > cantidad.txt
	CANTIDAD_IMAGENES=$(($(wc -l < cantidad.txt) - 2 )) #el 2 es para restar los archivos de texto que existen temporalmente en la carpeta
	ITERACIONES=$(wc -l < prueba.txt)

	for (( i=1; i<=$ITERACIONES; i++ ))
	do
		p="p"
		LINEA="${i}${p}"
	 	NOMBRE=$(sed -n $LINEA prueba.txt) 
		convert $NOMBRE -gravity center -resize 512x512+0+0 \-extent 512x512 $NOMBRE
	done
	echo "Se encontraron $ITERACIONES imagenes validas de $CANTIDAD_IMAGENES."
	if [ $ITERACIONES -ne 0 ]; then
	echo "Se les cambio la resolucion a 512x512"
	fi 
	rm prueba.txt cantidad.txt
	cd ../../..
}
