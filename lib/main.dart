import 'package:flutter/material.dart';
import 'package:movie_mania/views/widget_tree.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 33, 80, 234),
          brightness: Brightness.dark,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
