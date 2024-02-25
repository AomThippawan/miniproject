import "package:flutter/material.dart";
import "package:miniproject_note/login.dart";

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => MyApp(),
      },
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Text('data'));
          }),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('menu1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('menu2'),
                onTap: () {},
              ),
              ListTile(
                title: Text('menu3'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
