#!/bin/sh

# Saibo lay couleurs
C_ROUGE="\e[1;31m"
C_BLEU="\e[1;34m"
C_GRIS="\e[1;30m"
C_BLANC="\e[1;37m"
C_JAUNE="\e[1;33m"
C_VERT="\e[0;32m"
C_DEFAUT="\033[0m"

# On exécute la commande
mpc $1 > /dev/null

# On définit les variables
morceau=`mpc | head -n 1`

# On affiche l'état et le morceau joué
if [ -z "$(mpc | grep -o '\[playing\]' | sed -e 's/\[playing\]/p/g')" ]; then
 if [ "`mpc | wc -l`" == "1" ]; then
  echo -e "${C_ROUGE}[Arrêté]${C_DEFAUT}"
 else
  echo -e "${C_JAUNE}[Lecture en pause]${C_DEFAUT}" && echo -e "\033[1m$morceau\033[0m"
 fi
else
 echo -e "${C_BLEU}[Lecture en cours]${C_DEFAUT}" && echo -e "\033[1m$morceau\033[0m"
fi
