#! /bin/bash
#1. statsWords.sh Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).
TEXTO=$(cat $1)
#Se crea un lista que contiene todas las palabras del archivo
palabras=(${TEXTO//' '/ })
#Se incializan las variables
SUMA=0
CONT=0
MIN=$(echo ${#palabras[0]})
MAX=$(echo ${#palabras[0]})

#Comienza el recorrido en el listado
for i in "${palabras[@]}"
do
        #Limpiamos las palabras, eliminando . ,
	CAD=$(echo $i | tr "." "\n")
        CAD=$(echo $CAD | tr "," "\n")
	#Calculamos la longitud de cada una
        LON=$(echo ${#CAD})
	#Actualizamos el valos de las variables
        SUMA=$((LON+SUMA))
        CONT=$((CONT+1))
        #echo $LON $SUMA $CONT
        if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
        if [[ $LON -gt $MAX ]]; then MAX=$LON; fi
        #echo "MINIMO:$MIN MAXIMO:$MAX"
done
#Calculamos el promedio
PROM=$((SUMA/CONT))

#Imprimimos el resultado
echo "A continuación, se muestran los indicadores de longitud de cada palabra encontrada en el archivo $1:"

echo "Longitud Mínima: $MIN, Longitud Máxima: $MAX, Longitud Promedio: $PROM"


