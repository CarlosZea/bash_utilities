#!/bin/bash

nanai="/tmp"
ls > $nanai/lista1

cantidadLineas=$(wc -l $nanai/lista1 | cut -d " " -f1)

for (( n=1; n<=cantidadLineas; n++ )); do
	nombre=$(head -n $n $nanai/lista1 | tail -n 1 | tr '_' ' ')
	nombre=${nombre%.*}
	echo "<li> $nombre </li>"

done
rm -f $nanai/lista1
