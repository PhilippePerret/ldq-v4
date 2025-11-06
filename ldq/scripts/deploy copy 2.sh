#!/bin/bash
set -e

echo "Transfert vers le serveur…"
rsync -avz --delete --exclude='_build' --exclude='deps' --exclude='.DS_Store' . icare@ssh-icare.alwaysdata.net:/home/icare/www/ldq/

echo "Installation des dépendances…"
ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix deps.get"

echo "Déploiement des assets…"
ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix assets.deploy"

echo "Construction de la release…"
ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix release --overwrite"

ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && echo \"DATABASE_URL: \$DATABASE_URL\""

# echo "Migrations…"
# # ssh icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix ecto.migrate"
# ssh -t icare@ssh-icare.alwaysdata.net "cd /home/icare/www/ldq && MIX_ENV=prod mix ecto.migrate"


echo "Déploiement terminé !"