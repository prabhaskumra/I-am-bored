import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'onDeviceData.db';
  // static final _dbName = 'onDeviceData1.db';
  static final _dbVersion = 1;

  static final _savedListTable = 'savedListTable';

  static final columnId = 'columnId';
  static final activity = 'activity';
  static final type = 'type';
  static final participants = 'participants';
  static final price = 'price';
  static final link = 'link';
  static final key = 'key';
  static final accessibility = 'accessibility';
  static final isFavourite = 'isFavourite';
  static final savedTime = 'savedTime';
  static final notes = 'notes';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_savedListTable 
      ($columnId INTEGER PRIMARY KEY,
      $activity TEXT NOT NULL,
      $type TEXT NOT NULL,
      $participants INTEGER NOT NULL,
      $price FLOAT NOT NULL,
      $link TEXT NOT NULL,
      $key TEXT NOT NULL,
      $accessibility FLOAT NOT NULL,
      $isFavourite INTEGER NOT NULL,
      $savedTime TEXT NOT NULL,
      $notes)
      ''');

    //
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_savedListTable, row);
  }

  Future<List<Map<String, dynamic>>> queryALl() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> returnedList = await db.query(_savedListTable);
    returnedList = returnedList.reversed.toList();
    return returnedList;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    // String activity_value = row[activity];
    return await db
        .update(_savedListTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(_savedListTable, where: '$columnId = ? ', whereArgs: [id]);
  }

  // static Future<void> insert(String table, Map<String, Object> data) async {
  //   final dbPath = await sql.getDatabasesPath();
  //   sql.openDatabase(path.join(dbPath, 'places.db'), onCreate: (db, version) {
  //     return db.execute('sql');
  //   }, version: 1);
  // }

}
