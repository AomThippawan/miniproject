import "package:flutter/material.dart";
//import "package:miniproject_note/Profile.dart";
import "package:miniproject_note/calender.dart";
import 'package:miniproject_note/Home.dart';
//import "package:miniproject_note/main.dart";

class NavBar extends StatelessWidget {
  NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text('HOME'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            title: Text('CALENDER'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Calendar()));
            },
          ),
          ListTile(
            title: Text('To do list'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
