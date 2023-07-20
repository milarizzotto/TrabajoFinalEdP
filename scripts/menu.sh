#!/bin/bash

source ./scripts/generar.sh
source ./scripts/procesar.sh
source ./scripts/descomprimir.sh
source ./scripts/comprimir.sh

echo "Bienvenidos a nuestro trabajo practico final de Entorno de Programacion. Les presentamos las opciones:"
PS3="Elija que quiere hacer: "
select opcion in "Generar imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir imagenes" "Salir"
do
	case $opcion in
		"Generar imagenes") echo "Elija cuantas imagenes generar" && read RESP && echo "Generando imágenes... espere, por favor" && generar $RESP &> /dev/null && echo "$RESP imágenes generadas con éxito." && PASO=1 ;;
		"Descomprimir imagenes") if [ -e ./datasets/imagenes/imgcomprimidas.zip ] && [ -e ./datasets/imagenes/suma_verificacion.txt ]
					then 
					 	descomprimir ./datasets/imagenes/imgcomprimidas.zip ./datasets/imagenes/suma_verificacion.txt > /dev/null 
						echo "Imágenes descomprimidas con éxito."
					else
					 echo "No se encuentran archivo comprimido. Primero pase por la opción 1. Si en realidad su última opción fue la 3, ahora elija la 4."
					fi;;
		"Procesar imagenes") if [ -e ./datasets/imagenes/imgDescomprimidas ]
				     then
					 procesar 
					echo "Imágenes procesadas con éxito!"
					BANDERA=1
				     else
					echo "No hay imágenes para procesar. Debe elegir primero la opción 2"
				     fi;;
		"Comprimir imagenes") if [ -e ./datasets/imagenes/imgDescomprimidas ] && [[ $BANDERA -eq 1 ]]
				     then
					comprimir 
					echo "Se completaron todos los pasos del programa con éxito."
				     else
					echo "No se encontraron imágenes para comprimir o no pasó por la opción 3. Primero procéselas en esa opción"
				     fi;;
		"Salir") echo "Gracias por usar nuestro programa. Hasta luego!" && break ;;
		*) echo "Opcion no valida. Seleccione otra: " && continue ;; 
	esac
done
exit 0
