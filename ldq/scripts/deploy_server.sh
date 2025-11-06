#!/bin/bash
set -e

source /home/icare/www/ldq/.secrets/env
cd /home/icare/www/ldq
export MIX_ENV=prod
echo "Obtention des dépendances…"
mix deps.get
echo "Compilation…"
mix compile
echo "Déploiement des assets…"
mix assets.deploy
echo "Production de la release…"
mix release --overwrite
echo "Migrations…"
_build/prod/rel/ldq/bin/ldq eval "LdQ.Release.migrate"
