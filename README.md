# TP : Navigation Responsive

Un TP pour voir différents concepts clés dans Flutter :
- L'implémentation d'un LayoutBuilder pour réagir à la largeur de l'écran (Responsivité)
- L'implémentation d'une BottomNavigationBar au sein d'un widget Stateful (small screen)
- L'implémentation d'un Navigation Rail (large screen)


## Exercice 1 - Implémenter LayoutBuilder
L'idée est d'utiliser le Widget LayoutBuilder pour avoir accès à la taille de l'écran (constraints) et retourner un Widget différent en fonction de la taille de l'écran

- MainNavigation doit renvoyer un LayoutBuilder
- Créer les fonctions _smallScreenLayout() et _largeScreenLayout() qui doivent retourner (pour le moment) un texte centré à l'écran
- Si "constraints.maxWidth" est inférieur à 450, retourner _smallScreenLayout(), sinon retourner _largeScreenLayout()

> https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html


## Exercice 2 - Layout "small screen" - BottomNavigationBar
Attention, cette fois on ne peut pas utiliser la propriété de Scaffold "bottomNavigationBar" car on ne souhaite avoir cette forme de navigation que dans le cas où la largeur de l'écran est réduite.
A la place, on va devoir profiter du fait que MainNavigation est Stateful pour implémenter _smallScreenLayout() correctement.

- On va avoir besoin d'une variable selectedIndex pour stocker l'index sélectionné du menu de navigation
- On va avoir besoin d'une variable mainArea pour stocker une référence au widget que l'on souhaite afficher en fonction de la navigation
- _smallScreenLayout renvoie un Column avec deux éléments
- Le premier élément doit prendre tout l'espace disponible et afficher mainArea
- Le deuxième élément sera la BottomNavigationBar avec les différents items, et doit modifier le State de "selectedIndex" en fonction de la sélection de l'utilisateur
- mainArea dépend de selectedIndex il devrait donc être marqué en late au même niveau que selectedIndex
- dans la fonction build, utiliser un switch sur selectedIndex pour affecter un widget (Home, Profil, Likes) à mainArea

> https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

## Exercice 3 - Layout "large screen" - NavigationRail
Le Widget NavigationRail va permettre d'implémenter la navigation avec un layout plus adapté à un écran large (desktop).
Les propriétés de NavigationRail sont un peu différentes de BottomNavigationBar mais globalement les deux implémentations se ressemblent beaucoup :
- la propriété **destinations** joue le même rôle ques **items** et liste des widgets **NavigationRailDestination**
- la propriété **onDestinationSelected** joue le même joue que **onTap**
- **selectedIndex** doit obligatoirement être fourni pour que la navigation fonctionne correctement
- **extended** peut être fourni pour afficher le display "extended" du NavigationRail. On peut lui passer simplement **true** ou une condition comme **constraints.maxWidth >= 600** pour réagir à la taille de la fenêtre.


- _largeScreenLayout() devrait cette fois renvoyer un Row
- Le premier élément sera le NavigationRail avec les différents items de navigation
- Le deuxième élément doit prendre tout l'espace disponible et afficher mainArea
