import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pciu_hubspot/ui/screens/home_screen.dart';
import 'package:pciu_hubspot/ui/screens/links_screen.dart';
import 'package:pciu_hubspot/ui/screens/more_screen.dart';
import 'package:pciu_hubspot/ui/screens/profile_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const LinksScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.link),
            label: 'Links',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.density_medium_sharp),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
