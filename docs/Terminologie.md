# Terminologie



Chaque statut de visiteur est représenté par une lettre dans les textes techniques et le propgramme.

| Lettre | Sens     | Bit  | Description                                                  |
| ------ | -------- | ---- | ------------------------------------------------------------ |
| L      | Lecteur  | 1    | Le lecteur n’est pas un membre du comité de lecture, c’est quelqu’un qui vient chercher des livres à lire, qui ont reçu le label de qualité.<br />Le lecteur est un statut que peut avoir n’importe quelle personne au sein du label |
| A      | Auteur   | 2    | C’est un auteur. Il peut être auteur sans avoir soumis de livre au comité. |
| M      | Membre   | 4    | C’est un membre du comité de lecture. Il peut avoir différents grade en fonction de son ancienneté et ses résultats au sein du comité de lecture. |
| V      | Visiteur | 0    | C’est un simple visiteur, non identifié.                     |
| I      | Inscrit  | 8    | C’est un visiteur authentifié, donc qui s’est inscrit. Tous les autres statuts héritent forcément de ce statut, mais un inscrit peut rester simplement un inscrit. Il est informé des activités du label, sans y participer ni en lisant ni en écrivant. |
| X      | Admin    | 16   | Un administrateur du site, qui peut avoir différents grades  |
| G      | Guest    | 32   | Un visiteur non inscrit, qui est exceptionnellement invité à venir visiter le label, qui a accès à plus de parties du site qu’un simple visiteur ou un simple inscrit. |

