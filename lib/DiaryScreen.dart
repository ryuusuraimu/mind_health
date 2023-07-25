import 'package:flutter/material.dart';


// 日記画面
class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Screen'),
      ),
      body: const Center(
          child: Text('開発中',style: TextStyle(fontSize: 50.0),)
      ),
    );
  }
}
