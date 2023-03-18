import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../days/daysClass/days_class.dart';
import 'package:path/path.dart';
// import '../db.dart';

Future<Database> dataBase() async {
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'Thusday.db'),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE thusday (title TEXT PRIMARY KEY, content TEXT)');
    },
  );
  return dataBase;
}
Future<void> insertSchedule(ThusdaySchedule thusday) async {
  final db = await dataBase();
  await db.insert(
    'thusday',
    thusday.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteSchedule(String title) async {
  final db = await dataBase();
  await db.delete('thusday', where: 'title = ?', whereArgs: [title]);
}

Future<void> updateSchedule(ThusdaySchedule thusday) async {
  final db = await dataBase();
  await db.update('thusday', thusday.toMap(), whereArgs: [thusday.title]);
}

Future<List<Map<String, dynamic>>> showSchedule() async {
  final db = await dataBase();
  final List<Map<String, dynamic>> map =
      await db.rawQuery('SELECT * FROM thusday');
  return map.toList();
}
