import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieMania'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 147, 255),
      ),
    );
  }
}