import 'package:flutter/material.dart';
import 'package:my_schedule/days/friday.dart';
import 'package:my_schedule/days/saturday.dart';
import 'package:my_schedule/days/sunday.dart';
import 'package:my_schedule/days/thursday.dart';
import 'package:my_schedule/days/thusday.dart';
import 'package:my_schedule/days/wednesday.dart';
import './ui/Home.dart';
import './days/monday.dart';
void main() {
   runApp(MaterialApp(
    title: 'My Schedule',
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/monday': (context) => const MondayScheduleHome(),
      '/Thusday': (context) => const ThusdayScheduleHome(),
      '/Wednesday': (context) => const WednesdayScheduleHome(),
      '/Thursday': (context) => const ThursdayScheduleHome(),
      '/Friday': (context) => const FridayScheduleHome(),
      '/Saturday': (context) => const SaturdayScheduleHome(),
      '/Sunday': (context) => const SundayScheduleHome(),
    },
  ));
  WidgetsFlutterBinding.ensureInitialized();
}
