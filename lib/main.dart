import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ThemeData _lightTheme = ThemeData(
      primaryColor: Colors.blue,
      hintColor: Colors.blue,
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)));

  static final ThemeData _darkTheme = ThemeData(
      primaryColor: Colors.blue,
      hintColor: Colors.black,
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)));

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Health',
      theme: ThemeData(
          primaryColor: Colors.blue,
          hintColor: Colors.blue,
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black))),
      home: const HomeScreen(),
    );
  }
}