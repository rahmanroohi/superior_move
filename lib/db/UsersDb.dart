import 'package:superior_move/public/DB.dart';
import 'package:superior_move/model/Users.dart';
import 'package:sqflite/sqflite.dart';

class UsersDb {
  static const userId = 'userId';
  static const username = 'username';
  static const nickname = 'nickname';
  static const user_code = 'user_code';
  static const email = 'email';
  static const tel1 = 'tel1';
  static const date = 'date';


}


 const UsersTb = 'USERS';
String UsersDbTableCreateQuery =
    "CREATE TABLE IF NOT EXISTS ${UsersTb} ("
    "${UsersDb.userId} INTEGER PRIMARY KEY,"
    "${UsersDb.username} TEXT,"
    "${UsersDb.nickname} TEXT,"
    "${UsersDb.user_code} INTEGER,"
    "${UsersDb.email} INTEGER,"
    "${UsersDb.tel1} TEXT,"
    "${UsersDb.date} INTEGER"
    ")";
