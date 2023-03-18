import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Schedule'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.lightGreenAccent,
        body: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Monday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/monday');
                        },
                      )),
                ),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Thusday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Thusday');
                        },
                      )),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Wednesday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Wednesday');
                        },
                      )),
                ),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Thursday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Thursday');
                        },
                      )),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Friday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Friday');
                        },
                      )),
                ),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Saturday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Saturday');
                        },
                      )),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 15)),
                Card(
                  elevation: 20,
                  child: Container(
                      color: Colors.white,
                      width: 170,
                      height: 120,
                      child: ListTile(
                        title: const Text('Sunday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/Sunday');
                        },
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
