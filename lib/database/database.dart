import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseStore {
  Database? database;
  String databaseName = "DB_STORE";
  int databaseVersion = 1;
  final StreamController<List<Map<String, dynamic>>> _streamController =
      StreamController.broadcast();

  Stream<List<Map<String, dynamic>>> get customerStream =>
      _streamController.stream;

  DatabaseStore() {
    checkDatabase();
  }

  Future<Database> checkDatabase() async {
    if (database != null) {
      return database!;
    } else {
      database = await initDatabase();
      return database!;
    }
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    debugPrint("Database path: $path");
    return openDatabase(join(path, databaseName),
        version: databaseVersion, onCreate: createDatabase);
  }

  Future<void> createDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE Customer (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, password TEXT)");
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> customer = await database!.query("Customer");
    return customer;
  }

  Future<int> insert(Map<String, dynamic> customer) async {
    await checkDatabase();
    final id = await database!.insert("Customer", customer);
    _updateStream();
    return id;
  }

  Future<int> update(Map<String, dynamic> customer, int id) async {
    int row = await database!
        .update("Customer", customer, where: "id = ?", whereArgs: [id]);
    return row;
  }

  Future<void> _updateStream() async {
    final data = await fetchData();
    _streamController.add(data);
  }

  void dispose() {
    _streamController.close();
  }
}
