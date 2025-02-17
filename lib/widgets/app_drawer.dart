// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_mania/views/screens/profile_screen.dart';


final user = FirebaseAuth.instance.currentUser;

String name =  user?.displayName ?? "New User";

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<void> signOut() async {
  try {
    // Sign out from Google
    await GoogleSignIn().signOut();
    
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();
    
    print('User signed out');
  } catch (e) {
    print('Error signing out: $e');
  }
  }

  
  @override
  Widget build(BuildContext context) {
    return Drawer(  
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text((name)),
            accountEmail: Text(user!.email!),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 21, 18, 37)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 161, 161, 161),
              backgroundImage: NetworkImage(
                user?.photoURL ?? "assets/images/guestuser.png",
                ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProfileScreen();
                },));
            },
          ),
          
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: signOut,
            
          ),
        ],
      ),
    );
  }
}