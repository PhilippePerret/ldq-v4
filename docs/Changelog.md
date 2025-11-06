# Changelog

Historique simplifié de la création



## Création de la première app (Showcase)

~~~shell
mix phx.new.web showcase --module Showcase --database postgres --no-tailwind --binary-id --verbose
~~~

## Création de la deuxième app (ServHub)

~~~shell
mix phx.new.ecto serv_hub --module ServHub --database postgres --binary-id --verbose
~~~

## Création de la troisième app (Library)

~~~shell
mix phx.new.web library --module Library --binary-id  --database postgres --no-tailwind --verbose  
~~~

Comme on a un seul port, on doit avoir une app (endpoint) principal :

## Création du router : 

~~~shell
mix phx.new.web router --module Router --binary-id  --database postgres --no-tailwind --verbose
~~~

Et : 

* suppression du fichier `endpoint.ex` dans `router`, `showcase` et `library`.
* suppression de tout ce qui mentionne EndPoint et autre chose que Router dans les fichiers de configurations.
* Mettre toutes les propriétés `pubsub_server` à `ServHub.PubSub` (je crois que je n’en ai vu que deux).

Pour faire dépendre les apps library et showcase du router, il faut ajouter : 

~~~elixir
{:router, in_umbrella: true}
~~~

… dans leur dépendance (`mix.exs`). 

Il faut ajouter 

~~~elixir
      {:showcase, in_umbrella: true},
      {:library, in_umbrella: true}
~~~

… aux dépendances de router.

(et bien sûr toujours jouer `mix deps.get` pour que ces dépendances soient prises en compte).
