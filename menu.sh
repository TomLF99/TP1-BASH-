#!/bin/bash
parametro_optativo=$1

if [ "$parametro_optativo" = "-d" ]; then
    rm -r ~/EPNro1
    pkill -f "consolidar.sh"
else
    echo "--MENU--"
    echo "Presiona 1 para crear entorno"
    echo "Presiona 2 para correr proceso"
    echo "Presiona 3 para mostrar listado por padron de alumnos"
    echo "Presiona 4 para mostrar listado de notas"
    echo "Presiona 5 para mostrar tus datos"
    echo "Presiona 6 para salir"

    salir=0
    while [ $salir -eq 0 ]; do
        echo "Ingrese una opcion del menu"
        read opcion
        case $opcion in
            1)
                mkdir -p ~/EPNro1/{entrada,salida,procesado}
                echo "Entorno creado."
                cp consolidar.sh ~/EPNro1/
                ;;
            2)
                bash ~/EPNro1/consolidar.sh &
                ;;
            3)
                archivo=~/EPNro1/salida/$FILENAME.txt
                if [ -f "$archivo" ]; then
                    sort -k1 -n "$archivo" | while read linea; do
                        echo "$linea"
                    done
                else
                    echo "Archivo no encontrado"
                fi
                ;;
            4)
                archivo=~/EPNro1/salida/$FILENAME.txt
                if [ -f "$archivo" ]; then
                    sort -k5 -nr "$archivo" | head -n 10 | while read linea; do
                        echo "$linea"
                    done
                else
                    echo "Archivo no encontrado"
                fi
                ;;
            5)
                echo "Ingresa el número de padrón a buscar:"
                read padron
                archivo=~/EPNro1/salida/$FILENAME.txt
                if [ -f "$archivo" ]; then
                    grep -w "$padron" "$archivo"
                else
                    echo "Archivo no encontrado"
                fi
                ;;
            6)
                salir=1
                ;;
        esac
    done
fi
