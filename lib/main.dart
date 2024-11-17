import 'package:flutter/material.dart';
import 'package:hackutd/screens/homePage.dart'; // Adjust import path as needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // HomePage with data fetching logic
    );
  }
}
