import 'package:flutter/material.dart';

class BgmSelectionScreen extends StatelessWidget {
  const BgmSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('BGM 1'),
            onTap: () {
              // BGM 1を選択した際の処理
            },
          ),
          ListTile(
            title: const Text('BGM 2'),
            onTap: () {
              // BGM 2を選択した際の処理
            },
          ),
          ListTile(
            title: const Text('BGM 3'),
            onTap: () {
              // BGM 3を選択した際の処理
            },
          ),
        ],
      ),
    );
  }
}
