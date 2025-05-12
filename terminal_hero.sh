#!/bin/bash

while true; do
    # Affiche le menu
    echo "## Jeu des chiffres ##"
    echo "1. Jouer"
    echo "2. Quitter"
    echo "#######################"
    read -p "Choisissez une option : " option

    case $option in
        1)
            nombre=$((RANDOM % 10 + 1)) # Génère un nombre aléatoire entre 1 et 10
            essai_restant=3
            gagne=0

            while [ $essai_restant -gt 0 ]; do
                read -p "Devinez un nombre entre 1 et 10 : " devine
                if [ "$devine" -eq "$nombre" ]; then
                    echo "🎉 Bravo ! Vous avez deviné le nombre."
                    gagne=1
                    break
                else
                    echo " Ce n'est pas le bon nombre."
                    essai_restant=$((essai_restant - 1))
                fi
            done

            if [ $gagne -eq 0 ]; then
                echo " Vous avez perdu. Le bon nombre était $nombre."
            fi
            ;;
        2)
            echo " Merci d'avoir joué !"
            break
            ;;
        *)
            echo "⚠ Option invalide, veuillez réessayer."
            ;;
    esac

    echo "" # Ligne vide pour la lisibilité
done

exit 0
