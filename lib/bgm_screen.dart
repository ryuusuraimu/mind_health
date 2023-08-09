import 'package:flutter/material.dart';


class BgmSelectionScreen extends StatelessWidget {
  const BgmSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('BGM選択画面のコンテンツ'),
      ),
    );
  }
}


