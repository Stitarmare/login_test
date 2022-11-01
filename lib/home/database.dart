import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:login_test/login/login_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  Future<Database> openDataBase() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), 'test_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE logdata(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> saveUsername(LoginModel model) async {
    var db = await openDataBase();
    await db.insert(
      'logdata',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
