#!/bin/bash
set -e # permet de finir tout de suite en cas d'erreur

echo "Transfert vers le serveur…"
rsync -avz --delete --exclude='_build' --exclude='deps' --exclude='.DS_Store' . icare@ssh-icare.alwaysdata.net:/home/icare/www/ldq/

echo "Déploiement des assets…"
ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix assets.deploy"

echo "Construction de la release…"
ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix deps.get && MIX_ENV=prod mix release --overwrite"

echo "Déploiement terminé !"

#/home/icare/www/ldq/_build/prod/rel/ldq/bin/ldq start