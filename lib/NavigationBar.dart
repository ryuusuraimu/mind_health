import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
        home: MyWidget(),);
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _currentIndex = 0;

  List<Widget> pages = [
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red[100],
      child: const Center(child: Text('First Page')),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue[100],
      child: const Center(child: Text('Second Page')),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green[100],
      child: const Center(child: Text('Third Page')),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.orange[100],
      child: const Center(child: Text('Forth Page')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.nightlight),
            icon: Icon(Icons.nightlight_outlined),
            label: 'Night',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.music_note),
            icon: Icon(Icons.music_note_outlined),
            label: 'AIMusic',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}