#!/bin/bash

cd imagenes/imgDescomprimidas
ls -1 | grep ^[A-Z][a-z].*  > prueba.txt

ITERACIONES=$(wc -l < prueba.txt)

for (( i=1; i<=$ITERACIONES; i++ ))
do
	p="p"
	LINEA="${i}${p}"
 	NOMBRE=$(sed -n $LINEA prueba.txt) 
	convert $NOMBRE -gravity center -resize 512x512+0+0 \-extent 512x512 $NOMBRE
done
