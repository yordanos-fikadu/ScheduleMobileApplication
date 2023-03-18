import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../days/daysClass/days_class.dart';
import 'package:path/path.dart';
// import '../db.dart';
Future<Database> dataBase() async {
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'Friday.db'),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
          'CREATE TABLE friday (title TEXT PRIMARY KEY, content TEXT)');
    },
  );
  return dataBase;
}
Future<void> insertSchedule(FridaySchedule friday) async {
  final db = await dataBase();
  await db.insert(
    'friday',
    friday.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteSchedule(String title) async {
  final db = await dataBase();
  await db.delete('friday', where: 'title = ?', whereArgs: [title]);
}

Future<void> updateSchedule(FridaySchedule friday) async {
  final db = await dataBase();
  await db.update('friday', friday.toMap(), whereArgs: [friday.title]);
}

Future<List<Map<String, dynamic>>> showSchedule() async {
  final db = await dataBase();
  final List<Map<String, dynamic>> map =
      await db.rawQuery('SELECT * FROM friday');
  return map.toList();
}
