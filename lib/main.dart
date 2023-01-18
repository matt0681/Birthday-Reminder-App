import 'package:flutter/material.dart';
import 'package:second_app_2023_folder/BirthdayEntrySquare.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _birthdayEntries = [
    'birthday 1',
    'birthday 2',
    'birthday 3',
    'birthday 4',
    'birthday 5',
    'birthday 6',
    'birthday 7',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Birthday Buddee",
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          title: const Text("Birthday Buddee"),
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.teal[800],
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: _birthdayEntries.length,
            itemBuilder: (context, index) {
              return BirthdayEntrySquare(
                child: _birthdayEntries[index],
              );
            }),
      ),
    );
  }
}

// body: ListView.builder(
// padding: const EdgeInsets.all(8),
// itemCount: entries.length,
// itemBuilder: (BuildContext context, int index) {
// return Container(
// height: 50,
// // padding: const EdgeInsets.only(bottom: 8),
// decoration: const BoxDecoration(
// border: Border(
// top: BorderSide(width: 1),
// left: BorderSide(width: 2),
// right: BorderSide(width: 2),
// bottom: BorderSide(width: 1),
// ),
// ),
// child: Center(child: Text('Entry ${entries[index]}')),
// );
// }),

// open class EntryInfo(var name: String, var date: Int)
//
// class BirthdayEntry(val name: String, val date: Int) {
// private val birthdayEntryInfo = EntryInfo(name, date)
//
// fun setName(newName: String) {
// birthdayEntryInfo.name = newName
// }
//
// fun setDate(newDate: Int) {
// birthdayEntryInfo.date = newDate
// }
//
// fun print() {
// println("${birthdayEntryInfo.name}  -  ${birthdayEntryInfo.date}")
// }
// }
//
// fun main() {
// val nicksBDayEntry = BirthdayEntry("Nicholas Burkett", 99999)
// nicksBDayEntry.print()
//
// nicksBDayEntry.setName("Nikolai Burkae")
// nicksBDayEntry.print()
// }
