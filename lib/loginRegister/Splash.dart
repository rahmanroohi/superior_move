import 'package:flutter/material.dart';
import 'package:superior_move/loginRegister/Verification.dart';
import 'package:superior_move/model/Users.dart';
import 'package:superior_move/public/SizeConfig.dart';
import 'dart:async';
import 'Login.dart';


class Splash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Splash();
  }
}

class _Splash extends State<Splash>  {

  @override
  void initState() {
    super.initState();
    usersDb=new Users();
    loadData();
    StateUser();
  }

  /***
   * 0 login
   * 1 veryfication code
   */
  int screenSelect=0;

  String user="";

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
        (context) => screenSelect==0?
        Login():VerficationCode(username: user,)));
  }

  //commit change users
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
        title: 'Flutter Demo',
        home: Stack(
          children: <Widget>[
            Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(245, 89, 31, 100),
                    Color.fromRGBO(240, 109, 31, 10),
                    Color.fromRGBO(250, 151, 64, 1)
                  ])),
            ),
            Center(
                child: Container(
              width: SizeConfig.blockSizeHorizontal * 30,
              height: SizeConfig.blockSizeVertical * 30,
              child: Image.asset("assets/images/logo.png"),
            ))
          ],
        ));
  }
  Users usersDb;


  Future<String> StateUser()async
  {
    List<Users> tmpDb = await usersDb.ListUsers();

    if(tmpDb.length>0)
    {
      print(tmpDb[0]);
      if(tmpDb[0].flag==0)
        {
          screenSelect=1;
          user=tmpDb[0].username;
        }

    }

    return "";
  }
}
