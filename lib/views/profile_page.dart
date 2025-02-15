import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_mania/main.dart';
import 'package:movie_mania/widgets/app_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _usernamecontroller = TextEditingController();

  void updateDisplayName() {
    setState(() {
      name = _usernamecontroller.text.trim();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Display Name Updated: $name')),
    );
  }

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 147, 255),
          leading: BackButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } 
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return MainApp();
                  },));}
                  }
                  ),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0),
          
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Display Name: $name',
                      style: TextStyle(
                        fontSize: 20,
                      )
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 5.0),
          
              Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: TextField(
                            controller: _usernamecontroller,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Change Display Name',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          )),
                      ),
              
              SizedBox(height: 10,),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                    onTap: updateDisplayName,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Change',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),)
                    ),
                  )
                ),
              
              SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'Email: '+ FirebaseAuth.instance.currentUser!.email!,
                          style: TextStyle(
                          fontSize: 20,
                          )
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        
    );
  }
}