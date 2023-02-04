import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This is the main function. It runs the MyApp Widget class.
void main() {
  runApp(MyApp());
}

// This is a widget which represents our app. It sets up our app by defining a
// visual theme, sets the 'home' widget, names the app, and creates an app-wide
// state.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Birthday Laddie',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// This is the app's state. It contains the data the app needs to function.
// It extends ChangeNotifier, meaning it can notify other widgets about its own
// changes, especially in app data.
// This state is created and provided to the entirety of the app through
// the ChangeNotifierProvider, allowing any widget in the app access to the state.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // This functions creates a new random word, updates current, and
  // notifies all the app state listeners.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

// This is the Home Page widget. It creates the actual home page in the app.
class MyHomePage extends StatelessWidget {
  // This function keeps the home page updated to any changes.
  @override
  Widget build(BuildContext context) {
    // This function ensures the home page tracks any changes to the app's state.
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // This is a nested tree of widgets which build the visuals of the home page.
    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          BigCard(pair: pair), // accessing app state data.
          ElevatedButton(
            onPressed: () {
              appState.getNext();
              print('button pressed! - New random word generated.');
            },
            child: Text('next'),
          ),
        ],
      ),
    );
  }
}

// This widget class creates a large card in the center of the app to
// display the app's random word.
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var style = Theme.of(context).textTheme.displayMedium!.copyWith(
          color: theme.colorScheme.onPrimary,
        );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          pair.asLowerCase,
          style: style,
        ),
      ),
    );
  }
}
