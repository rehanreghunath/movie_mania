import 'package:flutter/material.dart';
import 'package:movie_mania/views/screens/login_screen.dart';
import 'package:movie_mania/views/screens/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens() {
     setState(() {
       showLoginPage = !showLoginPage;
     });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showregisterPage: toggleScreens);

    }else {
      return RegisterScreen(showLoginPage: toggleScreens);
    }
  }
}