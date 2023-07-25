import 'package:flutter/material.dart';
import 'meditation.dart';
import 'package:mind_health/bgm_screen.dart';
import 'package:mind_health/settingscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Mind Health"),
      ),
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
            child: Positioned.fill(
              child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
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
                      _buildMenuButton(
                        context,
                        text: '瞑想',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeditationSelectionScreen(),
                            ),
                          );
                        },
                      ),
                      _buildMenuButton(
                        context,
                        text: 'BGM',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BgmSelectionScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
        child: const Icon(Icons.settings),
      ),

      bottomNavigationBar: SizedBox(
        height: 69,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _NavigationBarIcon(Icons.home),
              label: '家',
            ),
            BottomNavigationBarItem(
              icon: _NavigationBarIcon(Icons.nightlight),
              label: '夜',
            ),
            BottomNavigationBarItem(
              icon: _NavigationBarIcon(Icons.auto_stories),
              label: '日記',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              // '家'アイコンがタップされたときの処理
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NightScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiaryScreen(),
                ),
              );
            }
          },
          selectedItemColor: Colors.purple[200],
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.grey,
        ),
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

class _NavigationBarIcon extends StatelessWidget {
  final IconData iconData;

  _NavigationBarIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.0,
      width: 56.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.transparent,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
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

class _NightScreenState extends State<NightScreen>{
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


//日記画面
class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen>{
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