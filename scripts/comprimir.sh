#!/bin/bash

function comprimir(){
	cd ./datasets/imagenes/imgDescomprimidas
	ls -1 > ./nombres_imagenes.txt
	echo "Guardando nombres de las imagenes en un archivo de texto..."
	sleep 2
	echo "Generando nombres_imagenes.txt"
	ls -1 | grep ^[A-Z][a-z].* > ./nombres_imagenes_validos.txt
	sleep 1
	echo "Filtrando nombres validos y guardandolos en otro archivo de texto..."
	sleep 2
	echo "Generando nombres_imagenes_validos.txt"
	cat ./nombres_imagenes_validos.txt | grep a.jpeg$ > ./nombres_terminados_a.txt
	sleep 1
	echo "Generando nombres_terminados_a.txt"
	wc -l < ./nombres_terminados_a.txt > ./cant_nombres_a.txt
	echo "Contando nombres terminados en a..."
	sleep 2
	echo "Se encontraron $(cat ./cant_nombres_a.txt)"
	echo "Comprimiendo archivo final con todo lo generado."	
	zip archivo_final *
	mv archivo_final.zip ../..
	sleep 2
	echo "Creado el archivo: archivo_final.zip"	
	rm *.txt
}


