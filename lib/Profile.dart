// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:miniproject_note/Home.dart';
//import 'package:miniproject_note/navbar.dart';

class Profile extends StatelessWidget {
  final String username;
  final String password;

  Profile({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello! ' + username,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome Reminder',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade100,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }
}
