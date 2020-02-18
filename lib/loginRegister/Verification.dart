import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superior_move/public/SizeConfig.dart';
import 'package:superior_move/public/BeautyTextfield.dart';
import 'package:superior_move/public/NetworkAPI.dart';
import 'package:superior_move/model/Users.dart';
class VerficationCode extends StatefulWidget {
 // const VerficationCode({Key key}) : super(key: key);

  final String username;

  // In the constructor, require a Todo.
  VerficationCode({Key key, @required this.username}) :super(key: key);

  @override
  _VerficationCode createState() => _VerficationCode(username);
}

class _VerficationCode extends State<VerficationCode> {
  Users users;
  final verficationCodeTF = TextEditingController();
  String   username="";
  _VerficationCode(this.username);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users=new Users();
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
                            "verify",
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

                                  keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                    hintText: "",
                                    hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(Icons.verified_user),
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
                                  onPressed: () async{
                                    bool result = await verification();
                                    if(result)
                                      print("yes absolotly");
                                    else
                                      print("no error");
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
                                        "Verify",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
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
            ))));
  }

  Future<bool> verification()async
  {


print(username+" - asdasdasdasdasd");
    final postData = {'user': username,'device':'123',"log":"123","code":verficationCodeTF.text};
    final header = {'header1key' : 'header1val'};
    await NetworkAPI().httpPostRequest('verify/', null, postData, (status, response){

      if (status == true) {

        switch(response.s)
        {
          case 1:
            users.updateFlag("1",Users.fromJson(response.d).username);
            print(response.d);
            return true;

            break;
          case 1000:


            break;
          case 1012:

            break;
          case 1100:

            break;
          case 1003:

            break;

          case 1011:

            break;

          case 1031:

            break;

          case 1001:

            break;
          case 1017:

            break;
        }


        if(response.s==1)
        {

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
