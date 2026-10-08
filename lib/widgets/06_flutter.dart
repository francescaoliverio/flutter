/*
 * Francesca Oliverio
 * 08/10/2026
*/

import 'package:flutter/material.dart';

// MaterialApp
//     └─ Scaffold
//         ├─ AppBar
//         └─ body: Center
//             └─ Text("Ciao")

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile App"),
          backgroundColor: Color(0xffff4466),
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 3,
          centerTitle: true,
        ),
        body: Center(
          child: Profile(name: "Francesca", info: "Flutter Student"),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final String info;

  const Profile({super.key, required this.name, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello, $name!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("You are a $info."),
      ],
    );
  }
}
