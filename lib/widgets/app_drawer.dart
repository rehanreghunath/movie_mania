import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_mania/views/screens/profile_screen.dart';
import 'package:movie_mania/views/screens/settings_screen.dart';

final user = FirebaseAuth.instance.currentUser;

String name =  user?.displayName ?? "New User";

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  
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
                user?.photoURL ?? "https://via.placeholder.com/150",
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
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Stats"),
            // onTap: () => Navigator.pushNamed(context, "/stats"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SettingsScreen();
                },));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () => FirebaseAuth.instance.signOut(),
            
          ),
        ],
      ),
    );
  }
}