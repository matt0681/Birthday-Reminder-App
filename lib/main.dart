import 'package:flutter/material.dart';
import 'package:second_app_2023_folder/birthday_entry_square.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  sharedPrefInit();

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
              return birthday_entry_square(
                nameChild: _birthdayEntries[index],
                birthdayChild: index,
              );
            }),
      ),
    );
  }
}

void sharedPrefInit() async {
  try {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.getString("app-name");
  } catch (err) {
    SharedPreferences.setMockInitialValues({});
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("app-name", "my-app");
  }
}

dynamic putInt(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setInt("$key", val);
  return _res;
}

dynamic putString(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setString("$key", val);
  return _res;
}

dynamic getInt(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  int? _res = prefs.getInt("$key");
  return _res;
}

dynamic getString(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? _res = prefs.getString("$key");
  return _res;
}
