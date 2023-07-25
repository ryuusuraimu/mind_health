import 'package:flutter/material.dart';

// 夜モード画面
class NightScreen extends StatelessWidget {
  const NightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Screen'),
      ),
      body: const Center(
          child: Text('おやすみなさい😴',style: TextStyle(fontSize: 50.0),)
      ),
    );
  }
}