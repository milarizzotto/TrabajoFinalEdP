#!/bin/bash

echo "Bienvenidos al Trabajo Practico"
echo "Elija que quiere hacer:"
echo "Ingrese g para generar imágenes"
echo "Ingrese d para descargar imágenes"
echo "Ingrese p para procesar imágenes"
echo "Ingrese c para comprimir imágenes"

read RESP
case $RESP in
g) echo "Elegiste g";;
d) echo "d";;
p) echo "p";;
c) echo "c";;
esac
exit 0
