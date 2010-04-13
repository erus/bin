#!/bin/sh

# Où sont situés les wallpapers ?
walls_dir="/home/$USER/Images/Wallpapers"

# On donne le nombre de wallpapers
walls_nbr=`ls $walls_dir|wc -l`

# On en choisit un au hasard
selected=`ls $walls_dir|tail -$((RANDOM%$walls_nbr))|head -n 1`

# On l'applique grâce à feh
feh --bg-scale $walls_dir/$selected
