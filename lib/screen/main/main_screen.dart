import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/main/index_nav_provider.dart';
import 'package:slurp_restaurant_app/screen/bookmark/bookmark_screen.dart';
import 'package:slurp_restaurant_app/screen/home/dashboard_screen.dart';
import 'package:slurp_restaurant_app/screen/setting/setting_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const _screens = [
    DashboardScreen(),
    BookmarkScreen(),
    SettingScreen(),
  ];

  static const _navItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(Icons.favorite_outline_rounded),
      selectedIcon: Icon(Icons.favorite_rounded),
      label: "Favorite",
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: "Setting",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return _screens[value.indexBottomNavBar];
        },
      ),
      bottomNavigationBar: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return NavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            selectedIndex: value.indexBottomNavBar,
            onDestinationSelected: (index) {
              context.read<IndexNavProvider>().setIndextBottomNavBar = index;
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            animationDuration: const Duration(milliseconds: 500),
            destinations: _navItems,
          );
        },
      ),
    );
  }
}
