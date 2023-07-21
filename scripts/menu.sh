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
		"Generar imagenes") echo "Elija cuantas imagenes generar" && read RESP && echo "Generando imagenes... espere, por favor" && generar $RESP &> /dev/null && echo "$RESP imagenes generadas con exito." && PASO=1 ;;
		"Descomprimir imagenes") if [ -e ./datasets/imagenes/imgcomprimidas.zip ] && [ -e ./datasets/imagenes/suma_verificacion.txt ]; then 
					 	descomprimir ./datasets/imagenes/imgcomprimidas.zip ./datasets/imagenes/suma_verificacion.txt > /dev/null 
						BANDERA=2
						echo "Imagenes descomprimidas con exito."
					elif [[ $BANDERA -eq 1 ]]; then
					 echo "La ultima opcion ingresada fue la 3, ahora debe elegir la 4."
					elif [[ $BANDERA -eq 2 ]]; then
					echo "Ya se realizo esta accion, continue con la opcion 3"
					else
					echo "No se encuentra archivo para descomprimir. Primero pase por la opción 1"
					fi;;
		"Procesar imagenes") if [ -e ./datasets/imagenes/imgDescomprimidas ]; then
					 procesar 
					echo "Imagenes procesadas con exito!"
					BANDERA=1
				     else
					echo "No hay imagenes para procesar. Debe elegir primero la opcion 2"
				     fi;;
		"Comprimir imagenes") if [ -e ./datasets/imagenes/imgDescomprimidas ] && [[ $BANDERA -eq 1 ]]; then
					comprimir 
					echo "Se completaron todos los pasos del programa con exito."
					BANDERA=3
				     elif [[ $BANDERA -ne 1 ]]; then
					echo "No paso por la opcion 3. Primero proceselas en esa opcion"
				     else
					echo "No se encontraron imagenes para comprimir. Primero pase por la opcion 3"
				     fi;;
		"Salir") echo "Gracias por usar nuestro programa. Hasta luego!" && break ;;
		*) echo "Opcion no valida. Seleccione otra: " && continue ;; 
	esac
done
exit 0
