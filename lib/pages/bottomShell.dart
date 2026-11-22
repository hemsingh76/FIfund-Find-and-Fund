import 'package:fifund/pages/dashboard.dart';
import 'package:fifund/pages/profilePage.dart';
import 'package:flutter/material.dart';

import 'createPage.dart';

class bottomShell extends StatefulWidget {
  const bottomShell({super.key});

  @override
  State<bottomShell> createState() => _bottomShellState();
}

class _bottomShellState extends State<bottomShell> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    dashboard(),
    createPage(),
    profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: const Color(0xFFE8E6FA),
            indicatorColor: Colors.white,
            labelTextStyle: WidgetStateProperty.resolveWith((states){
              final selected = states.contains(WidgetState.selected);
              return TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? Colors.green.shade800 : Colors.indigo.shade900,
              );
            }),
              iconTheme: WidgetStateProperty.resolveWith((states) {
                final selected = states.contains(WidgetState.selected);
                return IconThemeData(
                  color: selected ? Colors.green.shade800 : Colors.indigo.shade900,
                );
            })
      ),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (i) => setState(() => _selectedIndex = i),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.explore_outlined) ,
                  selectedIcon: Icon(Icons.explore),
                  label: 'Explore',),
              NavigationDestination(icon: Icon(Icons.create_outlined),
                  selectedIcon: Icon(Icons.create),
                  label: 'Create'),
              NavigationDestination(icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle),
                  label: 'Profile',),
            ],
          )),


    );
  }
}
