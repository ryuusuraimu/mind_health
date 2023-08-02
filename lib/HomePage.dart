import 'package:flutter/material.dart';
import 'Meditation/MeditationScreen.dart';
import 'bgm_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
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
                image: AssetImage('assets/wall_paper/flower.png'),
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Home screen navigation
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // 瞑想プログラムを受けるが押された際の処理
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MeditationSelectionScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              '瞑想',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // BGMを選択するが押された際の処理
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BgmSelectionScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'BGM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text("Home"),
                onTap: () {
                  // Handle Home screen navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.spa_outlined, // Replace 'Meditation' text with meditation icon
                  size: 30,
                ),
                title: Text('Meditation'),
                onTap: () {
                  // Handle Meditation screen navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeditationSelectionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.chat_outlined, // Replace 'Chat' text with chat icon
                  size: 30,
                ),
                title: Text('Chat'),
                onTap: () {
                  // Handle Chat screen navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.headphones_outlined, // Replace 'Music' text with music icon
                  size: 30,
                ),
                title: Text('Music'),
                onTap: () {
                  // Handle Music screen navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BgmSelectionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_outlined, // Replace 'Settings' text with settings icon
                  size: 30,
                ),
                title: Text('Settings'),
                onTap: () {
                  // Handle Settings screen navigation here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
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
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
        child: Text('Chat screen content'),
      ),
    );
  }
}


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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
      body: ListView(
        children: [
          ListTile(
            title: const Text('アプリのテーマ変更'),
            onTap: () {
              // テーマ変更処理
            },
          ),
          ListTile(
            title: const Text('アプリアイコンの変更'),
            onTap: () {
              // アイコン変更処理
            },
          ),
          ListTile(
            title: const Text('アカウント情報'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountInfoScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('アプリの利用状況のログ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppUsageLogScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

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
        child: Text('アカウント情報のコンテンツ'),
      ),
    );
  }
}

class AppUsageLogScreen extends StatelessWidget {
  const AppUsageLogScreen({Key? key}) : super(key: key);

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
        child: Text('利用状況のログコンテンツ'),
      ),
    );
  }
}