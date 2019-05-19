#!/bin/bash

now="/tmp"
ls > $now/lista_Nombres
ls -b > $now/lista_Cambiar
echo #!/bin/bash > cambioNombre
cantidadLineas=$(wc -l $now/lista_Nombres | cut -d " " -f1)
for (( n=1; n<=$cantidadLineas; n++ )) 
	do 
	nombre=$(head -n $n $now/lista_Nombres | tail -n 1 | tr ' ' '_')
	nombreACambiar=$(head -n $n $now/lista_Cambiar | tail -n 1) 
	if [[ $nombreACambiar == $nombre || $nombreACambiar == 'lista_Nombres' || $nombreACambiar == 'lista_Cambiar' ]]
       	then
		echo mismo nombre > /dev/null
	else
		echo mv $nombreACambiar $nombre >> cambioNombre
 	        	
	fi
	
done

chmod +x cambioNombre
./cambioNombre
rm -f $now/lista_Nombres $now/lista_Cambiar 
rm -f cambioNombre

