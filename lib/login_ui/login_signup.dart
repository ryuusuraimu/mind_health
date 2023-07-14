import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
bool isFirstLaunch = true;//初回起動フラグ
DateTime? lastLoginTime; //最終ログイン日時

class _LoginPageState extends State<LoginPage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Mind Health',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 30) //大きければ後ほど修正
              )),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 20),
          )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border:  OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed:(){

            },
            child: const Text('forgot Password'),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                print(nameController.text);
                print(passwordController.text);
              },
            )
          ),
          Row(
            children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  //signup screen
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ));
  }
}