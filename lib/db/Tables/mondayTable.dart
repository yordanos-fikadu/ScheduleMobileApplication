import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../days/daysClass/days_class.dart';
import 'package:path/path.dart';
// import '../db.dart';
Future<Database> dataBase() async {
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'Monday.db'),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE monday (title TEXT PRIMARY KEY, content TEXT)');
    },
  );
  return dataBase;
}
Future<void> insertSchedule(MondaySchedule monday) async {
  final db = await dataBase();
  await db.insert(
    'monday',
    monday.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteSchedule(String title) async {
  final db = await dataBase();
  await db.delete('monday', where: 'title = ?', whereArgs: [title]);
}

Future<void> updateSchedule(MondaySchedule monday) async {
  final db = await dataBase();
  await db.update('monday', monday.toMap(), whereArgs: [monday.title]);
}

Future<List<Map<String, dynamic>>> showSchedule() async {
  final db = await dataBase();
  final List<Map<String, dynamic>> map =
      await db.rawQuery('SELECT * FROM monday');
  return map.toList();
}
