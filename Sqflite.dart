import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Student.dart';

class Sqflite{
  static final _databaseName = "Farmer.db";
  static final _databaseVersion = 1;

  // DatabaseHelper._privateConstructor();
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Sqflite.internal();
  static final Sqflite _instance = Sqflite.internal();
  factory Sqflite() => _instance;

  static Database? _database;



  Future<Database?> get database async {
    if (_database != null) return _database;
    String path = join(await getDatabasesPath(), _databaseName);
    return _database = await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(Student.createTable);

  }
  Future<int?> insertStudent(Map<String, dynamic> list) async {
    Database? db = await database;
    var res = await db?.insert("student", list);
    print(" $res");
    return res;
  }

  //all user list
  Future<List<Student>> queryAllRowsData() async {
    var db = await database;
    List<Map<String, dynamic>> resultMap =
    await db!.query("student", orderBy: "id DESC");
    return resultMap.map((f) => Student.fromMap(f)).toList();
  }

  Future<int?> insertRecord(Map<String, dynamic> list, String table) async {
    Database? db = await database;
    var res = await db?.insert(table, list);
    return res;
  }

  //delete todo
  Future<int?> delete(int id) async {
    Database? db = await database;
    return await db?.delete("student", where: 'id = ?', whereArgs: [id]);
  }




}