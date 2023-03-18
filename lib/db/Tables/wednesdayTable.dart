import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../days/daysClass/days_class.dart';
import 'package:path/path.dart';
// import '../db.dart';

Future<Database> dataBase() async {
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'Wednesday.db'),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE wednesday (title TEXT PRIMARY KEY, content TEXT)');
    },
  );
  return dataBase;
}
Future<void> insertSchedule(WednesdaySchedule wednesday) async {
  final db = await dataBase();
  await db.insert(
    'wednesday',
    wednesday.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteSchedule(String title) async {
  final db = await dataBase();
  await db.delete('wednesday', where: 'title = ?', whereArgs: [title]);
}

Future<void> updateSchedule(WednesdaySchedule wednesday) async {
  final db = await dataBase();
  await db.update('wednesday', wednesday.toMap(), whereArgs: [wednesday.title]);
}

Future<List<Map<String, dynamic>>> showSchedule() async {
  final db = await dataBase();
  final List<Map<String, dynamic>> map =
      await db.rawQuery('SELECT * FROM wednesday');
  return map.toList();
}
