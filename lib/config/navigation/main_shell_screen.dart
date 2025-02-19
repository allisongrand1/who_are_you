import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShellScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen(
    this.navigationShell, {
    super.key,
  });

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int get currentIndex => widget.navigationShell.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            groupAlignment: 0,
            onDestinationSelected: goIndex,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.face_retouching_natural),
                selectedIcon: Icon(Icons.face_retouching_natural_rounded),
                label: Text('Определи'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                selectedIcon: Icon(Icons.people_rounded),
                label: Text('Сравни'),
              ),
            ],
            selectedIndex: currentIndex,
          ),
          Expanded(
            child: SafeArea(
              child: widget.navigationShell,
            ),
          ),
        ],
      ),
    );
  }

  void goIndex(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == currentIndex,
    );
  }
}
