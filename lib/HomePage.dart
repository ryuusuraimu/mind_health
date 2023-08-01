import 'package:flutter/material.dart';
import 'package:mind_health/app.dart';
// import 'package:foundation_flutter/foundation.dart';
import 'meditation.dart';
import 'package:mind_health/bgm_screen.dart';
import 'settingscreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.body, FloatingActionButton? floatingActionButton}) : super(key: key);
  final Widget body;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const NightScreen(),
    const DiaryScreen(),
    const BgmSelectionScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items:[
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text("Home"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.bedtime),
            title: const Text("Sleep"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.menu_book),
            title: const Text("Learn"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.music_note),
            title: const Text("Music"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
            selectedColor: Colors.green,
          ),
        ],
      ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wall_paper/morning.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  _buildMenuButton(
                    context,
                    text: 'チャット',
                    onTap: () {
                      // チャットボタンが押されたらの処理
                    },
                  ),
                  const SizedBox(height: 16), // ボタン間に余白を追加
                  _buildMenuButton(
                    context,
                    text: '瞑想',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MeditationSelectionScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16), // ボタン間に余白を追加
                  _buildMenuButton(
                    context,
                    text: 'BGM',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BgmSelectionScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, {required String text, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

// 夜モード画面
class NightScreen extends StatefulWidget {
  const NightScreen({Key? key}) : super(key: key);

  @override
  _NightScreenState createState() => _NightScreenState();
}

class _NightScreenState extends State<NightScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Screen'),
      ),
      body: const Center(
        child: Text(
          'おやすみなさい😴',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}

// 日記画面
class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Screen'),
      ),
      body: const Center(
        child: Text(
          '開発中',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
