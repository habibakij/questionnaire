
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/data_model.dart';

class DatabaseHelper{

  static late DatabaseHelper _databaseHelper;
  static late Database _database;
  DatabaseHelper.createInstance();
  factory DatabaseHelper(){
    _databaseHelper ??= DatabaseHelper.createInstance();
    return _databaseHelper;
  }

  String tableName= "akij_table";
  String colID= "id";
  String colName= "name";
  String colDeathName= "deathName";
  String colProvasiName= "provasiName";
  String colGender= "gender";
  String colDestination= "destination";
  String colDesignation= "designation";
  String colCompany= "techno";

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database;
  }
  /// init db
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path= "${directory.path}akij.db";
    var akijDatabase= openDatabase(path, version: 1, onCreate: _createDB);
    return akijDatabase;
  }
  /// create db
  void _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE $tableName($colID INTEGER PRIMARY KEY, $colName TEXT,  $colDeathName TEXT,  $colProvasiName TEXT,  $colGender TEXT,  $colDestination TEXT, $colDesignation TEXT, $colCompany TEXT)');
  }
  /// fetch data
  Future<List<Map<String, dynamic>>> fetchDataList() async {
    Database database= await this.database;
    var result= await database.query(tableName, orderBy: "$colID ASC");
    return result;
  }
  /// update
  Future<int> updateData(DataStoredModel model) async {
    Database database= await this.database;
    var result= await database.update(tableName, model.toMap(), where: "$colID = ?", whereArgs: [model.id]);
    return result;
  }
  /// delete
  Future<int> deleteData(int id) async {
    Database database= await this.database;
    var result= await database.rawDelete("DELETE FROM $tableName WHERE $colID =  $id");
    return result;
  }

}