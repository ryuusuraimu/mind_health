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