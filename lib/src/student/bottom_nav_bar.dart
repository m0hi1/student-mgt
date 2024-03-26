import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppNavigationBottomBar extends StatelessWidget {
  const MyAppNavigationBottomBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goTab(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.computer),
            icon: Icon(Icons.computer_outlined),
            label: 'Courses',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.pages_sharp),
            icon: Icon(Icons.pages_outlined),
            label: 'Attendance',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _goTab,
      ),
    );
  }
}
