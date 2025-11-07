#!/bin/bash

read -p "Chemin absolu du fichier/dossier source : " source
read -p "Chemin absolu du dossier destination : " dest

if [ ! -e "$source" ]; then
  echo "Source inexistante"
  exit 1
fi

if [ ! -d "$dest" ]; then
  echo "Destination n'est pas un dossier"
  exit 1
fi

basename=$(basename "$source")
name="${basename%.*}"

ln -s "$source" "$dest/$name"