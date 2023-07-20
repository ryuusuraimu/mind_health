import 'package:flutter/material.dart';
import 'package:mind_health/HomePage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mind Health',
      color: Colors.black,
      // theme: ThemeData(
      //   primarySwatch: Colors.white,
      // ),
      home: HomePage(),
    );
  }
}