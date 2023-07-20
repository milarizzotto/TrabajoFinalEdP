#!/bin/bash

function comprimir(){
	cd ./datasets/imagenes/imgDescomprimidas
	ls -1 > ./nombres_imagenes.txt
	echo "Guardando nombres de las imágenes en un archivo de texto..."
	echo "Generando nombres_imagenes.txt"
	ls -1 | grep ^[A-Z][a-z].* > ./nombres_imagenes_validos.txt
	echo "Filtrando nombres válidos y guardandolos en otro archivo de texto..."
	echo "Generando nombres_imagenes_validos.txt"
	cat ./nombres_imagenes_validos.txt | grep a.jpeg$ > ./nombres_terminados_a.txt
	echo "Generando nombres_terminados_a.txt"
	wc -l < ./nombres_terminados_a.txt > ./cant_nombres_a.txt
	echo "Contando nombres terminados en a..."
	echo "Se encontraron $(cat ./cant_nombres_a.txt)"
	echo "Comprimiendo archivo final con todo lo generado."	
	zip archivo_final *
	mv archivo_final.zip ../..
	echo "Creado el archivo: archivo_final.zip"	
	rm *.txt
}


