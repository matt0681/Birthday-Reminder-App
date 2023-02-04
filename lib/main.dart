import 'package:flutter/material.dart';
import 'package:second_app_2023_folder/birthday_entry_square.dart';
import 'package:second_app_2023_folder/user_input_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * This is the main function. It initializes the shared preferences storage
 * system as well as runs the application. It starts by running the MainPage function.
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Birthday - Laddie!',
      home: MyHomePage(title: 'Birthday - Laddie!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




//
// /*
//  * This class represents the 'home' page of the app, or the main screen used by
//  * the app. It is a stateful widget so it will make use of the _MainPageState function.
//  */
// class MainPage extends StatefulWidget {
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// /*
//  * This is the _MainPageState class. It contains code which actually builds the
//  * various widgets. The main page consists of an app bar with settings and title,
//  * A list of birthday entries that can be edited, and a button to add a new birthday
//  * entry.
//  */
// class _MainPageState extends State<MainPage> {
//   // Temporary entries:
//   final prefs = SharedPreferences.getInstance();
//   prefs.putInt('bobby', 02032000);
//
//
//   final List _birthdayEntries = [
//     'bobby',
//     'maxwell',
//     'dylan',
//     'jonathan',
//     'nicholas',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Birthday - Laddie!",
//       home: Scaffold(
//         backgroundColor: Colors.teal[300],
//         appBar: AppBar(
//           title: const Text("Birthday - Laddie!"),
//           backgroundColor: Colors.teal[900],
//           centerTitle: true,
//           elevation: 0.0,
//         ),
//         floatingActionButton: FloatingActionButton(
//           // This floating action button is the only way to add a new birthday entry.
//           // When clicked it will open up the user input page.
//           onPressed: () {
//             _navigateAndReturnEntryData(context);
//           },
//           backgroundColor: Colors.teal[800],
//           child: const Icon(Icons.add),
//         ),
//         body: ListView.builder(
//             itemCount: _birthdayEntries.length,
//             itemBuilder: (context, index) {
//               return birthday_entry_square(
//                 nameChild: _birthdayEntries[index],
//                 birthdayChild: index,
//               );
//             }),
//       ),
//     );
//   }
//
//   /*
//    * This function handles opening a new user input page and gets any data back
//    * to use in creating a new birthday entry.
//    */
//   Future<void> _navigateAndReturnEntryData(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const user_input_page()),
//     );
//
//     // The Navigator returns a list from the user input page. The first value is
//     // a boolean function indicating whether the user canceled out of the user input
//     // page. The second is a name entry, and third is a data entry.
//     var canceled = result[0];
//     var name = result[1];
//     var date = result[2];
//
//     if (canceled == false) {
//       print('$name - $date');
//     } else {
//       print('User canceled out of the new entry. No entry made.');
//     }
//   }
// }
//
// /*
//  * This function initializes the shared preferences storage system. It stores data
//  * onto the local device being used so that data wont be lost when closing and
//  * re opening the app.
//  */
// void sharedPrefInit() async {
//   try {
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     prefs.getString("app-name");
//   } catch (err) {
//     SharedPreferences.setMockInitialValues({});
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     prefs.setString("app-name", "my-app");
//   }
// }
//
// /*
//  * This function allows a key value to be paired with some integer data value.
//  * val must be an integer.
//  */
// dynamic putInt(key, val) async {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final SharedPreferences prefs = await _prefs;
//   var _res = prefs.setInt("$key", val);
//   return _res;
// }
//
// /*
//  * This function returns the integer data value associated with the given key.
//  */
// dynamic getInt(key) async {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final SharedPreferences prefs = await _prefs;
//   int? _res = prefs.getInt("$key");
//   return _res;
// }
//
