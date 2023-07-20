import 'package:flutter/material.dart';
import 'dart:async';
import 'meditation.dart';
import 'chat_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //AppBarを背景に広げる
      appBar: AppBar(
        backgroundColor: Colors.transparent, //AppBarを透明にする
        elevation: 0, //影を非表示
        title: const Text("Mind Health"),
      ),
      body: Stack(
        fit: StackFit.expand, //子ウィジットを画面全体に広げる
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wall_paper/morning.jpeg'),
                fit: BoxFit.cover, //画面サイズに調整
              ),
            ),
            child: Positioned.fill(
              child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5, //スライドの高さを調整するための係数
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            //チャットへ移動が押された際の処理
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'チャット',
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
                          onTap:(){
                            //瞑想が押された際の処理
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MeditationSelectionScreen(),
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
                          onTap: (){
                            //BGMを選択するが押された際の処理
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
                                fontSize:20.0,
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

//BGM選択画面（

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

// )BGM選択画面

//設定画面（
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

//）設定画面

//アカウント画面（
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
//）アカウント画面

//利用状況画面(
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

//)利用状況画面


