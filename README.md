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
- Le deuxième élément sera la BottomNavigationBar avec les différents items, et doit faire le lien avec la logique de navigation (pour déterminer mainArea en fonction de l'item sélectionné)
- Le premier élément doit prendre tout l'espace restant disponible et afficher mainArea
