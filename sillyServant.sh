#!/bin/bash
echo "ʚ  Ingresa tu nombre . . . "
read nombre

#Bucle para repetir el script
until [[ $terminar == "n" ]]
do
        echo "⋆.* Hola $nombre *.⋆"
        #Menu
        echo "Estamos cargando el menu! ๑•ᴗ•๑"
        sleep 2
        clear
        echo "Que deseas realizar $nombre?  ₍აᐢ. .ᐢ₎♡
        1. Recomendacion musical!
        2. Saber el clima!
        3. Saber tu signo!
        4. Journal!
        SISTEMA
        5. Actualiza Kali!
        6. Verificar archivos con permiso de ejecutar!"
        read opc
        echo "Elegiste la opcion $opc, pronto obtendras tus resultados ✩°｡⋆" 
        case $opc in
                1) echo "Cargando . . ."
                sleep 1
                        clear
                        #Guarda en un archivo el contenido del enlace proporcionado
                        curl -s https://www.last.fm/charts > file.txt
                        #Guardamos en un nuevo archivo los nombres de las canciones y artistas, buscandolos con grep
                        grep "data-track-name\|data-artist-name" file.txt > results.txt
                        #Realizamos la concatenaci[on de los elementos en un archivo final para facilitar su uso
                        cat  results.txt | paste -sd ',\n' >songs.txt
                        echo "El top 30 musical de hoy es: "
                        #Reemplezamos el formato de origen con uno mas comprensible usando sed
                        sed -e "s/data-track-name/Cancion/" -e "s/data-artist-name/Artista/" songs.txt
                ;;
                2) echo "Cargando . . ."
                        sleep 1
                        clear
                        echo "Ingresa el nombre de tu ciudad: "
                        read ciudad
                        #Se mostrara en pantalla solo las primeras 7 lineas de l sitio de la url
                        curl -s https://wttr.in/$ciudad | head -n 7
                ;;
                3) echo "Cargando . . ."
                        sleep 1
                        clear
                        echo "Ingresa tu dia de nacimiento"
                        read day
                        echo "Ingresa tu mes de nacimiento"
                        read month
                         if [[ month -eq 3 && day -ge 21 || month -eq 4 && day -le 19 ]]; then
                                echo "Eres Aries"
                        elif [[ month -eq 4 && day -ge 20 || month -eq 5 && day -le 20 ]]; then
                                echo "Eres Tauro"
                        elif [[ month -eq 5 && day -ge 21 || month -eq 6 && day -le 20 ]]; then
                                echo "Eres Geminis"
                        elif [[ month -eq 6 && day -ge 21 || month -eq 7 && day -le 22 ]]; then
                                echo "Eres Cancer"
                        elif [[ month -eq 7 && day -ge 23 || month -eq 8 && day -le 22 ]]; then
                                echo "Eres Leo"
                        elif [[ month -eq 8 && day -ge 23 || month -eq 9 && day -le 22 ]]; then
                                echo "Eres Virgo"
                        elif [[ month -eq 9 && day -ge 23 || month -eq 10 && day -le 22 ]]; then
                                echo "Eres Libra"
                        elif [[ month -eq 10 && day -ge 23 || month -eq 11 && day -le 21 ]]; then
                                echo "Eres Escorpio"
                        elif [[ month -eq 11 && day -ge 22 || month -eq 12 && day -le 21 ]]; then
                                echo "Eres Sagitario"
                        elif [[ month -eq 12 && day -ge 22 || month -eq 1 && day -le 19 ]]; then
                                echo "Eres Capricornio"
                        elif [[ month -eq 1 && day -ge 20 || month -eq 2 && day -le 18 ]]; then
                        echo "Eres Acuario"
                        elif [[ month -eq 2 && day -ge 19 || month -eq 3 && day -le 20 ]]; then
                                echo "Eres Piscis"
                        else
                                echo "Ingresa una fecha valida!"
                        fi
                ;;
                4) echo "Cargando . . ."
                        sleep 1
                        clear
                        date >> journal.txt
                        echo "Pendientes, notas o  recordatorios? Escribelos aqui ❀❛ ֊ ❛"
                        read notas
                        echo  $notas >> journal.txt
                        echo "Los contenidos en tu documento de Journaling son los siguientes . . ."
                        nl journal.txt
                ;;
                5) echo "Cargando . . ."
                        sleep 1
                        clear
                        sudo apt update -y
                        sudo  apt upgrade -y
                ;;
                6) echo "Cargando . . ."
                        sleep 1
                        clear
                        chmod +x sillyServant.sh
                        echo "Es posible ejecutar en bash usando ./ "
                        ls -l
                ;;
        esac
        echo "Deseas ejecutar otra opcion? . . . y/n"
        read terminar
        sleep 1
        echo -n ". "
        sleep 1
        echo -n ". "
        sleep 1
        echo -n ". "
        sleep 1
        clear
done
