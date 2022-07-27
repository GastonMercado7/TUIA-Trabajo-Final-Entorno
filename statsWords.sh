#! /bin/bash
#1. statsWords.sh Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).
TEXTO=$(cat $1)

#echo $TEXTO
#IFS=' ' read -r -a palabras <<< "$TEXTO"
palabras=(${TEXTO//' '/ })
SUMA=0
CONT=0
MIN=$(echo ${#palabras[0]})
MAX=$(echo ${#palabras[0]})
for i in "${palabras[@]}"
do
        CAD=$(echo $i | tr "." "\n")
        CAD=$(echo $CAD | tr "," "\n")
        LON=$(echo ${#CAD})
        SUMA=$((LON+SUMA))
        CONT=$((CONT+1))
        #echo $LON $SUMA $CONT
        if [[ $LON -lt $MIN ]]; then MIN=$LON; fi
        if [[ $LON -gt $MAX ]]; then MAX=$LON; fi
        #echo "MINIMO:$MIN MAXIMO:$MAX"
done
PROM=$((SUMA/CONT))
#printf "${palabras[0]}\n"

#echo ${#palabras[@]}

#echo $palabras

echo "A continuación, se muestran los indicadores de longitud de cada palabra encontrada en el archivo $1:"

echo "Longitud Mínima: $MIN, Longitud Máxima: $MAX, Longitud Promedio: $PROM"


