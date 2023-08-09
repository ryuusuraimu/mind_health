import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mind_health/DiaryScreen.dart';
import 'package:mind_health/NavigationBar.dart';

// 瞑想選択画面
class MeditationSelectionScreen extends StatelessWidget {
  const MeditationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: CircleAvatar(
          backgroundColor: Colors.black, // 戻るボタンの背景を黒色に設定
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // 戻るボタンのアイコンを白色に設定
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: false, // タイトルを中央寄せを解除
        elevation: 0,
        backgroundColor: Colors.transparent, // AppBarの背景を透明に設定
        title: const Text(
          "Meditation",
          style: TextStyle(color: Colors.black),
        ),
      ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () => const DiaryScreen(),
              child:Card(
                  color: Colors.cyan,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // アイコン、右寄せ
                    children: <Widget>[
                      ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 100),
                          child: Text("マインドフルネスとは", style: TextStyle(fontSize: 20))),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://stacademy-images.s3.amazonaws.com/uploads/class_detail/class_image/31221/detail1_2e68367b-7efc-4c11-8c13-42fc5a4496cf.png"),
                            )),
                      )
                    ],
                  )),
            ),
            Card(
                color: Colors.cyan,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 右寄せ
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 180),
                        child: Text("[初級]マインドフルネス", style: TextStyle(fontSize: 20))),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://e0.pxfuel.com/wallpapers/899/119/desktop-wallpaper-meditation-background-of-your-background-mindfulness.jpg"),
                          )),
                    )
                  ],
                )),
            Card(
                color: Colors.cyan,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 右寄せ
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 180),
                        child: Text("[中級]マインドフルネス", style: TextStyle(fontSize: 20))),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://fairwork.jp/wp-content/uploads/2022/06/levi-xu-dOhJtfXJZfw-unsplash.jpg"),
                          )),
                    )
                  ],
                )),
            Card(
                color: Colors.cyan,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 右寄せ
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 180),
                        child: Text("[上級]マインドフルネス", style: TextStyle(fontSize: 20))),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/woman-performs-yoga-moves-on-mountain-summit-royalty-free-image-1590150499.jpg?crop=0.877xw:0.810xh;0,0.190xh&resize=980:*"),
                          )),
                    )
                  ],
                )),
          ],
        )
    );
  }
}
