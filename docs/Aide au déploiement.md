# Aide au déploiement



Pour une release Phoenix umbrella, il faut :

1. Configurer la release dans mix.exs à la racine (définir quelle app démarre)
2. Générer un SECRET_KEY_BASE 
3. Configurer config/runtime.exs avec les variables d'environnement de production
4. Compiler la release avec MIX_ENV=prod mix release
5. La transférer sur Alwaysdata et la démarrer



**Problèmes potentiels qui pourraient survenir :**

Assets/CSS/JS :
•  Si tu ajoutes de nouvelles bibliothèques JS/CSS, vérifie qu'elles se compilent bien avec mix assets.deploy
•  Les images/fonts doivent être dans priv/static/ pour être servies

Base de données :
•  Les migrations : il faudra les jouer sur le serveur (mix ecto.migrate en prod)
•  Si tu changes de schéma, pense à migrer avant de déployer le code

Variables d'environnement :
•  Si tu ajoutes de nouvelles variables, les définir sur Alwaysdata
•  Pense au PHX_HOST si tu changes de domaine

Performance :
•  Pool de connexions DB (actuellement 10) à ajuster selon le trafic
•  Mémoire : surveiller la consommation avec des milliers d'utilisateurs

LiveView :
•  WebSockets : vérifier qu'Alwaysdata les supporte bien (normalement oui)

Nouvelles apps umbrella :
•  Les ajouter dans mix.exs (releases/applications)
•  Adapter le script de déploiement si nécessaire