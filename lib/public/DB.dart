import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:superior_move/db/UsersDb.dart';
class DB {
  DB._();
  static final DB db = DB._();

  static final _databaseName = "superior_move.db";
  static final _databaseVersion = 1;

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(UsersDbTableCreateQuery);
     }
}
