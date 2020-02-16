import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:superior_move/db/UsersDb.dart';
import 'package:superior_move/model/Users.dart';
import 'package:superior_move/public/Address.dart' as globals;
import 'package:superior_move/public/SizeConfig.dart';
import "package:superior_move/public/NetworkAPI.dart";
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:superior_move/model/BaseListDaynamicStandard.dart';
class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {

  final FullName = TextEditingController();
  final EmainPhone = TextEditingController();
  final Password = TextEditingController();
  Users users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users=new Users();

  }

  @override
  Widget build(BuildContext context) {
    print(globals.Address.UrlMain);
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(child:Container(
            color: Color.fromRGBO(248, 248, 248, 0.95),
            child: Stack(children: <Widget>[
              ListView(
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
                              "Register",
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
                    child:ListView(children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: SizeConfig.blockSizeVertical * 8),
                                TextField(
                                  controller: FullName,
                                  decoration: new InputDecoration(
                                      hintText: "Fullname",
                                      hintStyle: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold),
                                      prefixIcon: Icon(Icons.person),
                                      border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(50.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor: Colors.white70),
                                ),
                                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                                TextField(controller: EmainPhone,

                                  decoration: new InputDecoration(
                                      hintText: "Email or phone Number",
                                      hintStyle: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold),
                                      prefixIcon: Icon(Icons.phone),
                                      border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(50.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor: Colors.white70),
                                ),
                                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                                TextField(
                                  controller: Password,
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
                                SizedBox(height: SizeConfig.blockSizeVertical * 6),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 7,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Register();
                                    },
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
                                          "Register",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                                Align(
                                  alignment: Alignment(0.0, 0.85),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Don't have an account"),
                                      GestureDetector(
                                        child: Text(
                                          " Login",
                                          style: TextStyle(
                                              color: Color.fromRGBO(250, 151, 64, 1),
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      )

                    ],),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: FutureBuilder(
                  future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot snapshot)
                    {
                      List<Widget> children;

                      if (snapshot.hasData) {
                        children = <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Result: ${snapshot.data}'),
                          )
                        ];
                      } else if (snapshot.hasError) {
                        children = <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Error: ${snapshot.error}'),
                          )
                        ];
                      } else {
                        children = <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          )
                        ];
                      }

                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: children,
                        ),
                      );
                    }

                ),
              )
            ],))));
  }

  Future _calculation = Future<Users>.delayed(

    Duration(seconds: 2),
        () => new Users(),
  );



  Future<bool> Register()async
  {



    final postData = {'user': '09382126359','password': 'rahman123','nickname': 'rahman','device':'121321',"log":"sdfsdf"};
    final header = {'header1key' : 'header1val'};
    await NetworkAPI().httpPostRequest('register/', null, postData, (status, response){

      if (status == true) {

        if(response.s==1)
          {
            users.insert(Users.fromJson(response.d));
          }else
            {

            }
       /* for (var mainRequest in response) {
          MainRequest u =  MainRequest.fromMap(mainRequest);
         *//* Users.insert(u);*//**//* //insert to SQLite table*//*
        }*/
      }
      else{}
    });
    return true;
  }


}
