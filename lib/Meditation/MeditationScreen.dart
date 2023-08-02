import 'package:flutter/material.dart';
import 'package:mind_health/NavigationBar.dart';

// 瞑想選択画面
class MeditationSelectionScreen extends StatelessWidget {
  const MeditationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: CircleAvatar(
          backgroundColor: Colors.black, // 戻るボタンの背景を黒色に設定
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // 戻るボタンのアイコンを白色に設定
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: false, // タイトルを中央寄せを解除
        elevation: 0,
        backgroundColor: Colors.transparent, // AppBarの背景を透明に設定
        title: const Text(
          "Meditation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {},
              child: Text("初めての瞑想"),
            ),
          ],
        ),
    ),
    );
  }
}

class _MindflunessTest extends StatefulWidget
