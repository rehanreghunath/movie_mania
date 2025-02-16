import 'package:flutter/material.dart';
import 'package:movie_mania/data/notifiers.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier, 
      builder: (context, selectedPage, child) {
        return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.add_outlined),
          label: 'Add to Watchlist'),
        NavigationDestination(
          icon: Icon(Icons.list_rounded),
          label: 'Watchlist'),
      ],
      onDestinationSelected: (int value) {
          selectedPageNotifier.value = value;
      },
      selectedIndex: selectedPage,
      );
      },);
    
  }
}