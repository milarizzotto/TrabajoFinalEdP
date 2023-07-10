#!/bin/bash

source generar.sh
source procesar.sh
source descomprimir.sh
#source comprimir.sh

echo "Bienvenidos a nuestro trabajo práctico final de Entorno de Programación. Les presentamos las opciones:"
PS3="Elija qué quiere hacer: "
select opcion in "Generar imágenes" "Descomprimir imágenes" "Procesar imágenes" "Comprimir imágenes" "Salir"
do
	case $opcion in
		"Generar imágenes") echo "Elija cuántas imágenes generar" && read RESP && generar $RESP;;
		"Descomprimir imágenes") descomprimir ./imagenes/imgcomprimidas.zip ./imagenes/suma_verificacion.txt ;;
		"Procesar imágenes") procesar ;;
		"Comprimir imágenes") echo "c" ;;
		"Salir") echo "Gracias por usar nuestro programa. Hasta luego!" && break ;;
		*) echo "Opción no válida. Seleccione otra: " && continue ;; 
	esac
done
exit 0
