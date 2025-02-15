import 'package:flutter/material.dart';
import 'package:movie_mania/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 147, 255),
        leading: BackButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return MainApp();
                    },));
  }
}
          )
      ),
    );
  }
}