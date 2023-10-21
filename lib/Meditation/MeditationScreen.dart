import 'package:flutter/material.dart';
import 'MeditationDetailScreen.dart';

class MeditationSelectionScreen extends StatelessWidget {
  const MeditationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("初心者向け瞑想"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MeditationDetailScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('中級者向け瞑想'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MeditationDetailScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('上級者向け瞑想'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MeditationDetailScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
