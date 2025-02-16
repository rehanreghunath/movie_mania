import 'package:flutter/material.dart';
import 'package:movie_mania/data/notifiers.dart';
import 'package:movie_mania/views/screens/discover_screen.dart';
import 'package:movie_mania/views/screens/watchlist_screen.dart';
import 'package:movie_mania/widgets/navbar.dart';
import 'package:movie_mania/widgets/app_drawer.dart';

List<Widget> screens = [
  DiscoverScreen(),
  WatchlistScreen(),
] ;

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieMania',
          style: TextStyle(
            fontFamily: 'showg',
          ),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 147, 255),
        actions: [
          IconButton(onPressed: () {
            isDarkMode.value = !isDarkMode.value;
          }, 
          icon: ValueListenableBuilder(
            valueListenable: isDarkMode, 
            builder: (context, isDarkMode, child) {
              return Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode, color: Colors.amber,
              );
            },))
        ],
      ),
      drawer: AppDrawer(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier, 
        builder: (context, selectedPage, child) {
          return screens.elementAt(selectedPage);
      },),
      bottomNavigationBar: Navbar(),
    );
  }
}