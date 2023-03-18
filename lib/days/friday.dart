import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../db/Tables/fridayTable.dart' as db;
import './daysClass/days_class.dart';
class FridayScheduleHome extends StatefulWidget {
  const FridayScheduleHome({super.key});
  @override
  State<FridayScheduleHome> createState() => _FridayScheduleHomeState();
}

class _FridayScheduleHomeState extends State<FridayScheduleHome> {
  final _title = TextEditingController();
  final _content = TextEditingController();

  FridaySchedule input(String title, String content) {
    return FridaySchedule(title: title, content: content);
  }

  Widget alart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AlertDialog(
          alignment: Alignment.center,
          title: Column(
            children: const [
              Text('My Schedule', textAlign: TextAlign.center),
              Divider(color: Colors.blue, thickness: 3)
            ],
          ),
          content: Column(
            children: [
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    prefixIcon: Icon(Icons.view_day),
                    label: Text('title'),
                    hintText: 'eg.morning'),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                controller: _content,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    prefixIcon: Icon(Icons.content_copy),
                    label: Text('Content'),
                    hintText: 'eg.description'),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 50)),
                OutlinedButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all((Colors.green))),
                    onPressed: () async {
                      if (_title.text.isNotEmpty && _content.text.isNotEmpty) {
                        await db.insertSchedule(input(
                            _title.text.toString(), _content.text.toString()));
                      }
                    },
                    child: const Text('Save')),
                const Padding(padding: EdgeInsets.only(left: 40)),
                OutlinedButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all((Colors.red))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel'))
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Friday Schedule'),
          centerTitle: true,
        ),
        backgroundColor: Colors.greenAccent,
        body: FutureBuilder(
          future: db.showSchedule(),
          builder: (context, snapshot) {
            List<Widget> lists = <Widget>[];
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.length; i++) {
                lists.add(Card(
                  child: ListTile(
                    title: Text('${snapshot.data![i]['title']}'),
                    subtitle: Text('${snapshot.data![i]['content']}'),
                    trailing: IconButton(
                        onPressed: () async {
                          await db.deleteSchedule(snapshot.data![i]['title']);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return alart();
                        },
                      );
                      await db.updateSchedule(snapshot.data![i]['title']);
                    },
                  ),
                ));
              }
              return ListView(
                children: lists,
              );
            }
            return const Card(
                child: ListTile(
              title: Text(
                'No Schedule saved',
                textAlign: TextAlign.center,
              ),
            ));
          },
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          child: IconButton(
              iconSize: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return alart();
                  },
                );
              },
              icon: const Icon(Icons.add)),
        ));
  }
}
