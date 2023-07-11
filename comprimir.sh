#!/bin/bash

function comprimir(){
	cd imagenes/imgDescomprimidas
	ls -1 > ./nombres_imagenes.txt
	ls -1 | grep ^[A-Z][a-z].* > ./nombres_imagenes_validos.txt
	cat ./nombres_imagenes_validos.txt | grep a.jpeg$ > ./nombres_terminados_a.txt
	wc -l < ./nombres_terminados_a.txt > ./cant_nombres_a.txt
	zip archivo_comprimido *
	mv archivo_comprimido.zip ../
	rm *.txt
}

