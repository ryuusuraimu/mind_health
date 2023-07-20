import 'package:flutter/material.dart';
import 'dart:async';


// 瞑想選択画面
class MeditationSelectionScreen extends StatelessWidget {
  const MeditationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MindHealth'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 瞑想プログラム1が選択された際の処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeditationScreen(
                      programName: '瞑想プログラム1',
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    '瞑想プログラム1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 瞑想プログラム2が選択された際の処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeditationScreen(
                      programName: '瞑想プログラム2',
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    '瞑想プログラム2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 瞑想プログラム3が選択された際の処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeditationScreen(
                      programName: '瞑想プログラム3',
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    '瞑想プログラム3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 瞑想画面
class MeditationScreen extends StatefulWidget {
  final String programName;

  const MeditationScreen({
    Key? key,
    required this.programName,
  }) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  int selectedTime = 0;
  int remainingTime = 0;
  double meterHeight = 0;
  bool isTimerVisible = true; // 時間表示の可視性を管理するフラグ
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {
        meterHeight = _animationController.value * 200; // メーターの高さを更新
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startTimer(int duration) {
    setState(() {
      selectedTime = duration;
      remainingTime = duration;
      meterHeight = 200; // メーターを満タンにする
    });

    _animationController.reset();
    _animationController.forward();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime--;
        if (remainingTime <= 0) {
          timer.cancel();
          meterHeight = 0; // メーターをゼロにする
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation: ${widget.programName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTimerVisible) // 時間表示の可視性に応じてウィジェットを表示
              Text('残り時間: $remainingTime秒'),
            const SizedBox(height: 16.0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 20.0,
              height: meterHeight,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              '瞑想プログラム: ${widget.programName}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                startTimer(300); // 5分のタイマーを開始
              },
              child: const Text('5分'),
            ),
            ElevatedButton(
              onPressed: () {
                startTimer(900); // 15分のタイマーを開始
              },
              child: const Text('15分'),
            ),
            ElevatedButton(
              onPressed: () {
                startTimer(1800); // 30分のタイマーを開始
              },
              child: const Text('30分'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isTimerVisible = !isTimerVisible; // 時間表示の可視性を切り替え
          });
        },
        child: Icon(isTimerVisible ? Icons.timer_off : Icons.timer),
      ),
    );
  }
}