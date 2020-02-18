import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superior_move/loginRegister/Register.dart';
import 'package:superior_move/model/Users.dart';
import 'package:superior_move/public/SizeConfig.dart';
import 'package:superior_move/public/BeautyTextfield.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(child:Container(
            color: Color.fromRGBO(248, 248, 248, 0.95),
            child: ListView(
              children: <Widget>[
                Container(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 35,
                            height: SizeConfig.blockSizeVertical * 15,
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ),
                        Positioned(
                          bottom: SizeConfig.blockSizeVertical * 2,
                          right: SizeConfig.blockSizeHorizontal * 4,
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 35,
                    decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(245, 89, 31, 1),
                              Color.fromRGBO(250, 151, 64, 1)
                            ]),
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(100.0),
                        ))),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 64,
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 8,
                      right: SizeConfig.blockSizeHorizontal * 8),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: SizeConfig.blockSizeVertical * 8),
                            Material(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintText: "Number or Email",
                                    hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(Icons.phone),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white70),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 4),
                            TextField(
                              obscureText: true,
                              decoration: new InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.vpn_key),
                                  border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(50.0),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.white70),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2),
                            Container(
                              alignment: Alignment.centerRight,
                              width: SizeConfig.blockSizeHorizontal * 100,
                              child: GestureDetector(
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  print(" yes ");
                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 6),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 100,
                              height: SizeConfig.blockSizeVertical * 7,
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(245, 89, 31, 1),
                                          Color.fromRGBO(250, 151, 64, 1)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 100,
                                    height: SizeConfig.blockSizeVertical * 7,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Login",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 0.85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account"),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                              },
                              child: Text(
                                " Register",
                                style: TextStyle(
                                    color: Color.fromRGBO(250, 151, 64, 1),
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))));
  }


}
