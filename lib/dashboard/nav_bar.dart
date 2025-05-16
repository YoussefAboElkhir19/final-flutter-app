import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/dashboard_screen.dart';
import 'package:flutter_application_1/favorite/favorite_screen.dart';
import 'package:flutter_application_1/new_screen/new_screen.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';
import 'package:flutter_application_1/quote/quote_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          [
            DashboardScreen(),
            FavoriteScreen(),
            ProfilePage(),
            // TaskScreen(),
            QuoteScreen(),
          ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        // function to change the index of the selected item
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorite"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          // NavigationDestination(icon: Icon(Icons.tab_sharp), label: "new"),
          NavigationDestination(icon: Icon(Icons.format_quote), label: "Quote"),
        ],
      ),
    );
  }
}
