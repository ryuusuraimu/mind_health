import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'meditation.dart';
import 'package:mind_health/bgm_screen.dart';
import 'package:mind_health/settingscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.white, // Set background color to white
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the center
                children: [
                  _buildMenuButton(
                    context,
                    text: 'チャット',
                    onTap: () {
                      // チャットボタンが押されたらの処理
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildMenuButton(
                    context,
                    text: '瞑想',
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: const MeditationSelectionScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildMenuButton(
                    context,
                    text: 'BGM',
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: const BgmSelectionScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushNewScreen(
            context,
            screen: const SettingsScreen(),
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        },
        child: const Icon(Icons.settings),
      ),
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        navBarHeight: kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation bar items animation properties
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Container(color: Colors.white),
      Container(color: Colors.red),
      Container(color: Colors.green),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: Colors.black),
        title: ("家"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.nightlight, color: Colors.black),
        title: ("夜"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.auto_stories, color: Colors.black),
        title: ("日記"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Widget _buildMenuButton(BuildContext context,
      {required String text, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          color: Colors.white, // Set button background color to white
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black, // Set text color to black
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
        child: Text('おやすみなさい😴', style: TextStyle(fontSize: 50.0)),
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
        child: Text('開発中', style: TextStyle(fontSize: 50.0)),
      ),
    );
  }
}
