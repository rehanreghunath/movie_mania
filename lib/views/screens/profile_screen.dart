import 'package:flutter/material.dart';
import 'package:movie_mania/data/notifiers.dart';
import 'package:movie_mania/views/profile_page.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode, 
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 80, 234),
            brightness: isDarkMode? Brightness.dark : Brightness.light,
        ),
      ),
      home: ProfilePage(),
    );
    },);
  }
}