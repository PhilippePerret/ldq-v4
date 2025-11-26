#!/bin/bash
set -e

echo "Transfert vers le serveur…"
rsync -avz --delete --exclude='_build' --exclude='deps' --exclude='.DS_Store' . icare@ssh-icare.alwaysdata.net:/home/icare/www/ldq/

ssh icare@ssh-icare.alwaysdata.net "bash /home/icare/www/ldq/scripts/deploy_server.sh"
echo "Déploiement terminé !"
echo "Rejoignez https://www.atelier-icare.net/ldq/ pour le voir"