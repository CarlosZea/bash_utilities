#!/bin/bash

#elimina carpetas anidadas copiando todos los archivos de esa carpeta a una carpeta inicial desde donde corre el script.
#Author: Carlos Zea (CarlosZea_CAZ)  ingcarloszea@gmail.com

inicial=$(pwd)
actual=$(pwd)
ls -l | tail -n +2 > archivos.txt
echo "directorio uno" >> archivos.txt
howmany=$(ls -l | head -n 1 | cut -d " " -f2) # cuantos archivos y directorio hay, es un string


#for (( i=1; i<=$howmany; i++ )); do

#done

function nfolders {
	ndir=0
	for file in $actual/*
	do
		if [[ -d $file ]]; then
			ndir=$(($ndir+1 ))
			echo $file >> directorios.txt
		fi	
	done
	if [[ $ndir == 0 ]]; then
		echo hola putitos > /dev/null
	else
		nextdir=$(cat directorios.txt 2> /dev/null | head -n 1 )
		actual=$nextdir
		rm directorios.txt 2> /dev/null #si hay error, redirecciono al infinito y más allá
		cd $nextdir
	fi 
}
nfolders
echo "inicia while"
while [[ "$ndir" -gt 0 ]]; do
	echo $actual
	nfolders
	
	if [[ $ndir == 0 ]]; then
		echo "no hay más carpetas"
		cp -R $actual/*  $inicial
		rm -r $actual
		break
	fi
done




