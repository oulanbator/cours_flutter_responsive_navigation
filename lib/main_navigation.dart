import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          print("Small screen");
          return _smallScreenLayout(context);
        } else {
          print("Large screen");
          return _largeScreenLayout(context);
        }
      },
    );
  }

  _smallScreenLayout(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Small Screen"),
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
}
