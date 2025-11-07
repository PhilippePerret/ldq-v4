# ARCHITECTURE

*Ce document vise à décrire l’architecture de la version 4 du site LdQ.*

Cette version 4 est marquée par l’abandon de l’utilisation d’un *parapluie Phoenix*. Mais en gardant une séparation forte entre les choses :

* L’**ADMINISTRATION** du label (qui gère l’ensemble du site, aussi bien au niveau administratif qu’au niveau de la programmation).
* Le **COMITÉ DE LECTURE** du label, qui s’occupe des membres, gère leurs activités, leur permet une communication productive. On devrait d’ailleurs parler de « comités » au pluriel puisqu’il y en a de nombreux.
* La **VITRINE** du label (**Showcase**), avec sa partie la plus importante : son MANITESTE. Partie la plus statique du site, elle présente le label sous toutes ses dimensions. C’est la première partie qui doit être implémentée. C’est la partie la plus publique, ouverte à toutes et tous.
* Le **SERVICE DE COMS** (ou les *Coms*). Section qui gère la publicité faite au label et comment le label se fait connaitre, organise des évènements, des rencontres (webinaires), etc. Il comprend aussi la formation des membres du comité de lecture.
* La **BIBLIOTHÈQUE IDÉALE** (**Library**). Section où l’on peut trouver tous les livres qui ont reçu le label LdQ, les classements par coups de cœurs et par lecteurs, etc. L’utilisatrice/teur lectrice/teur peut s’y inscrire pour être informé de son activité. C’est pour ce lieu que le label existe principalement. On peut y laisser des avis assez développés.
* L’**ARÊNE**. C’est là que sont gérés les livres en cours d’estimation. Un auteur peut y mettre ses ouvrages en lecture, les membres du comité peuvent y faire leur estimation, y chercher des ouvrages à estimer.
* Les **COMPTES**. Service qui gère les utilisateurs à partir du moment où ils sont inscrits. Les comptes ont différents rôle et différents privilèges qui permettent de visiter et d’intervenir dans les autres sections de l’application. On trouve notamment : les super administrateurs, qui ont accès à tout, les membre du comité de lecture, les simples **autrices et auteurs** qui proposent leur livre, les simples **lectrices et lecteurs** qui ne font que choisir des livres dans la bibliothèque pour les lire, et peuvent laisser des coups de cœur et des avis. On trouve les **modérateurs**, qui encadrent le comité de lecture pour s’assurer que tous y travaillent dans la paix, qui surveillent également les messages déposés. Il y a les différents grades de **membre (du comité)** (un *membre* est une lectrice ou un lecteur qui fait partie du comité de lecture) qui donnent aux membres différents droits et privilèges. Il y a les **codeurs** qui travaillent sur la partie technique du site. Et il y a bien sûr les **administrateurs** qui gèrent l’ensemble des services. Bien entendu, ces statuts sont cumulatifs et un auteur proposant un livre peut être codeur, peut être membre du comité de lecture (à partir du moment où il ne juge pas son propre livre) et être administrateur-modérateur.
* La **CONCIERGERIE** (**ServHub**). Une sorte de « supervision » et de « partie partagée » de toutes les autres, là où chacun pourra venir puiser informatiquement des choses au niveau technique principalement (c’est Claude qui m’a suggéré cette partie « Shared »). Donc pour les éléments partagées, les helpers, les fonctions communes, etc.

## Principes

*(Section qui décrit les grands principes qui veulent être respectés dans ce développement)*

* **Déploiement continu**. Pour ne pas être confronté tout à coup au problème épineux du déploiement, le site verra un déploiement régulier et fréquent, et ce dès sa toute première implémentation (où l’on ne trouvera que la base du site avec ses grandes sections (appelées, selon Phoenix, les « applications » du parapluie).

## Problème des placements des ressources

Un point épineux est le placement des ressources, entendu qu’elles servent dans plusieurs parties. Le cas typique, ce sont les livres, qui servent pour la bibliothèque (library) en tant que livre à lire mais également dans le comité de lecture, où ils sont pris et évalués par les membres ou encore dans l’**Arêne** qui est le lieu où ils sont vraiment en « compétition », en « évaluation ». 

Il est choisi, pour cette ressource, de la laisser dans la bibliothèque (but ultime de cette application), avec des status différents qui permettront de vite savoir où ils en sont. Les quatre statuts principaux du livre étant : 

* **en proposition** (le livre est proposé à l’estimation, mais il n’est pas encore en lice)
* **en évaluation** (le livre a été accepté et se trouve mis en évaluation — choisi par les membres du comité, suivi par un parrain)
* **labelisation refusée** (le livre n’a pas reçu le label, a été rejeté pour x ou y raisons)
* **labélisé, en diffusion** (le livre a reçu le label, il peut être choisi dans la bibliothèque du site).

On peut donc dire que « physiquement », c’est toujours à la bibliothèque qu’on amène ses livres et qu’on peut en retirer, en lire.