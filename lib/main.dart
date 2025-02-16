import 'package:flutter/material.dart';
import 'package:movie_mania/data/notifiers.dart';
import 'package:movie_mania/main_page.dart';
import 'package:movie_mania/views/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_mania/views/screens/movie_details_screen.dart';
import 'package:movie_mania/views/screens/watchlist_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
    
      home: MainPage(),
    );
    },);
  }
}
