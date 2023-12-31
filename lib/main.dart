import 'package:flutter/material.dart';
import 'screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RDP To-do-list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage()
    );
  }
}
