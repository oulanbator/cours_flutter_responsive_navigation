import 'package:cours_flutter_responsive_navigation/screens/home.dart';
import 'package:cours_flutter_responsive_navigation/screens/likes.dart';
import 'package:cours_flutter_responsive_navigation/screens/profil.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  var selectedIndex = 0;
  late Widget mainArea;
  late Widget styledMainArea;

  @override
  Widget build(BuildContext context) {
    _selectMainAreaDestination();

    styledMainArea = ColoredBox(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: mainArea,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return _smallScreenLayout(context);
          } else {
            return _largeScreenLayout(context, constraints);
          }
        },
      ),
    );
  }

  _smallScreenLayout(BuildContext context) {
    return Column(
      children: [
        Expanded(child: styledMainArea),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Likes",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        )
      ],
    );
  }

  _largeScreenLayout(BuildContext context, BoxConstraints constraints) {
    return Row(
      children: [
        NavigationRail(
          extended: constraints.maxWidth >= 600,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text('Profil'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.favorite),
              label: Text('Likes'),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        Expanded(child: styledMainArea)
      ],
    );
  }

  void _selectMainAreaDestination() {
    switch (selectedIndex) {
      case 0:
        mainArea = Home();
        break;
      case 1:
        mainArea = Profil();
        break;
      case 2:
        mainArea = Likes();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
  }
}
