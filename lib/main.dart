import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 縦固定
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Health',
      theme: ThemeData(
          //brightness: Brightness.dark, // テーマを黒色に設定
          // 他のテーマ設定もここでカスタマイズできます
          ),
      home: const HomeScreen(),
    );
  }
}
