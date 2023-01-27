import 'package:flutter/material.dart';
import 'package:second_app_2023_folder/birthday_entry_square.dart';
import 'package:second_app_2023_folder/user_input_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * This is the main function. It initializes the shared preferences storage
 * system as well as runs the application. It starts by running the MainPage function.
 */
void main() {
  sharedPrefInit();

  runApp(MaterialApp(
    home: MainPage(),
  ));
}

/*
 * This class represents the 'home' page of the app, or the main screen used by
 * the app. It is a stateful widget so it will make use of the _MainPageState function.
 */
class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

/*
 * This is the _MainPageState class. It contains code which actually builds the
 * various widgets. The main page consists of an app bar with settings and title,
 * A list of birthday entries that can be edited, and a button to add a new birthday
 * entry.
 */
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
      title: "Birthday - Laddie!",
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          title: const Text("Birthday - Laddie!"),
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          // This floating action button is the only way to add a new birthday entry.
          // When clicked it will open up the user input page.
          onPressed: () {
            _navigateAndReturnEntryData(context);
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

  Future<void> _navigateAndReturnEntryData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const user_input_page()),
    );

    var name = result[0];
    var date = result[1];

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$name - $date')));
  }
}

/*
 * This function initializes the shared preferences storage system. It stores data
 * onto the local device being used so that data wont be lost when closing and
 * re opening the app.
 */
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

/*
 * This function allows a key value to be paired with some integer data value.
 * val must be an integer.
 */
dynamic putInt(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setInt("$key", val);
  return _res;
}

/*
 * This function allows a key value to be paired with some string data value.
 * val must be a string.
 */
dynamic putString(key, val) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setString("$key", val);
  return _res;
}

/*
 * This function returns the integer data value associated with the given key.
 */
dynamic getInt(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  int? _res = prefs.getInt("$key");
  return _res;
}

/*
 * This function returns the string data value associated with the given key.
 */
dynamic getString(key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? _res = prefs.getString("$key");
  return _res;
}
