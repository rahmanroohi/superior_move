// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:superior_move/db/UsersDb.dart';
import 'package:superior_move/public/DB.dart';
import 'package:superior_move/public/NetworkAPI.dart';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  int userId;
  String username;
  String nickname;
  String user_code;
  String email;
  String tel1;
  String date;
  int flag;

  Users({
    this.userId,
    this.username,
    this.nickname,
    this.user_code,
    this.email,
    this.tel1,
    this.date,
    this.flag
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userId: json["username"]!=null? json["username"]:"" ,
    username: json["username"],
    nickname: json["nickname"],
    user_code: json["user_code"],
    email: json["email"],
    tel1: json["tel1"],
    date: json["date"],
  );
  factory Users.fromMap(Map<String, dynamic> json) => new Users (
      userId: json[UsersDb.userId],
      username: (json[UsersDb.username] != null) ?json[UsersDb.username] : "",
      nickname:  (json[UsersDb.nickname] != null) ?json[UsersDb.nickname] : "",
      user_code:  json[UsersDb.user_code],
      email: json[UsersDb.email],
      tel1:  (json[UsersDb.tel1] != null) ?json[UsersDb.tel1] : "",
      date: json[UsersDb.date],
      flag:  (json[UsersDb.flag] != null)?json[UsersDb.flag]:""
  );


  Map<String, dynamic> toJson() => {
    "username": username,
    "nickname": nickname,
    "user_code": user_code,
    "email": email,
    "tel1": tel1,
    "date": date,
    "flag": flag,
  };
  Map<String, dynamic> toMap() => {
    UsersDb.username: username,
    UsersDb.username: username,
    UsersDb.user_code: user_code,
    UsersDb.email: email,
    UsersDb.tel1: tel1,
    UsersDb.date: date,
    UsersDb.flag: flag
  };



  static syncUsers () {

    NetworkAPI().httpPostRequest('getUsers/', null, {'token': 'tokenId'}, (status, response){

      if (status) {
      /*  for (var user in response) {
          Users u =  Users.fromMap(user);
          UsersDb.insert(u);
        }*/
      }
      else
      {

      }

    });

  }

  DB tmpProvide;
   insert(Users model,String flag) async {

     deleteAll();

     tmpProvide = DB.db;
    Database db = await tmpProvide.database;
    var query = await db.rawQuery(
        "INSERT OR REPLACE INTO  ${UsersTb}"
            "(${UsersDb.username}, ${UsersDb.nickname}, ${UsersDb.user_code},"
            "${UsersDb.email},  ${UsersDb.tel1}, ${UsersDb.date}, ${UsersDb.flag})"
            " VALUES (?,?,?,?,?,?,?)",
        [
          model.username,
          model.nickname,
          model.user_code,
          model.email,
          model.tel1,
          model.date,
          flag
        ]);
    return query;
  }

   update(Users model) async {

     tmpProvide = DB.db;

     Database db = await tmpProvide.database;

    var result = await db.update("${UsersTb}", model.toMap(),
        where: "${UsersDb.userId} = ?", whereArgs: [model.userId]);
    return result;
  }

  updateFlag(String  flag,String users) async {

    tmpProvide = DB.db;

    Database db = await tmpProvide.database;

    var result = await db.execute("update $UsersTb set flag='$flag' where username='$users'");
    return result;
  }

   deleteRecord(int id) async {
     tmpProvide = DB.db;

     Database db = await tmpProvide.database;

    return db.delete("${UsersTb}", where: "${UsersDb.userId} = ?", whereArgs: [id]);
  }
   deleteAll() async {
     tmpProvide = DB.db;

     Database db = await tmpProvide.database;

    return db.delete("${UsersTb}");
  }

  Future<List<Users>> ListUsers() async {
    // Get a reference to the database.
    tmpProvide = DB.db;

    Database db = await tmpProvide.database;


    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await
    db.query(UsersTb);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Users(
        userId: maps[i]['userId'],
        nickname: maps[i]['nickname'],
        username: maps[i]['username'],
        email: maps[i]['email'],
        tel1: maps[i]['tel1'],
        date: maps[i]['date'],
        flag: maps[i]['flag'],
      );
    });
  }


}
