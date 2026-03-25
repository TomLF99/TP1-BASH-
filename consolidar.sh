#!/bin/bash
entrada=~/EPNro1/entrada
salida=~/EPNro1/salida
procesado=~/EPNro1/procesado

touch "$salida/$FILENAME.txt"

while true; do
    for archivo in "$entrada"/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "$salida/$FILENAME.txt"
            mv "$archivo" "$procesado/"
        fi 
    done
    sleep 3
done
