import 'package:flutter/material.dart';
import 'package:movie_mania/views/screens/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(  
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Guest"),
            accountEmail: Text("guest123@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 161, 161, 161),
              
              backgroundImage: NetworkImage(
                "https://icons.veryicon.com/png/o/miscellaneous/youyinzhibo/guest.png",
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
            // onTap: () => Navigator.pushNamed(context, "/stats"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            
          ),
        ],
      ),
    );
  }
}