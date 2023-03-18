import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../days/daysClass/days_class.dart';
import 'package:path/path.dart';
// import '../db.dart';

Future<Database> dataBase() async {
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'Sunday.db'),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE sunday (title TEXT PRIMARY KEY, content TEXT)');
    },
  );
  return dataBase;
}
Future<void> insertSchedule(SundaySchedule sunday) async {
  final db = await dataBase();
  await db.insert(
    'sunday',
    sunday.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteSchedule(String title) async {
  final db = await dataBase();
  await db.delete('sunday', where: 'title = ?', whereArgs: [title]);
}

Future<void> updateSchedule(SundaySchedule sunday) async {
  final db = await dataBase();
  await db.update('sunday', sunday.toMap(), whereArgs: [sunday.title]);
}

Future<List<Map<String, dynamic>>> showSchedule() async {
  final db = await dataBase();
  final List<Map<String, dynamic>> map =
      await db.rawQuery('SELECT * FROM sunday');
  return map.toList();
}
