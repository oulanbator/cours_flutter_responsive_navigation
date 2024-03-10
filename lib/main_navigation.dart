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

  @override
  Widget build(BuildContext context) {
    _selectMainAreaDestination();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return _smallScreenLayout(context);
        } else {
          return _largeScreenLayout(context);
        }
      },
    );
  }

  _smallScreenLayout(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: mainArea),
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
      ),
    );
  }

  _largeScreenLayout(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Large Screen"),
      ),
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
