#!/bin/bash

source generar.sh
source procesar.sh
source descomprimir.sh
source comprimir.sh

echo "Bienvenidos a nuestro trabajo practico final de Entorno de Programacion. Les presentamos las opciones:"
PS3="Elija que quiere hacer: "
select opcion in "Generar imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir imagenes" "Salir"
do
	case $opcion in
		"Generar imagenes") echo "Elija cuantas imagenes generar" && read RESP && generar $RESP;;
		"Descomprimir imagenes") descomprimir ../datasets/imagenes/imgcomprimidas.zip ../datasets/imagenes/suma_verificacion.txt ;;
		"Procesar imagenes") procesar ;;
		"Comprimir imagenes") comprimir ;;
		"Salir") echo "Gracias por usar nuestro programa. Hasta luego!" && break ;;
		*) echo "Opcion no valida. Seleccione otra: " && continue ;; 
	esac
done
exit 0
