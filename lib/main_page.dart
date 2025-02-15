import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_mania/views/screens/login_screen.dart';
import 'package:movie_mania/views/widget_tree.dart';
import 'package:movie_mania/auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WidgetTree();
        }
        else {
          return AuthPage();
        }
      },)
    );
  }
}