import 'package:flutter/material.dart';
import 'package:superior_move/public/SizeConfig.dart';

class Splash extends StatelessWidget {
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
}
