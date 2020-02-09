import 'package:flutter/material.dart';
import 'package:superior_move/loginRegister/Register.dart';
import 'package:superior_move/loginRegister/Verification.dart';
import 'loginRegister/Splash.dart';
import 'loginRegister/Login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //commit change users
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,
          canvasColor: Colors.transparent, //----Change to this------------
          accentColor: Colors.blue,
        ),
      home: VerficationCode()
    );
   }
}

