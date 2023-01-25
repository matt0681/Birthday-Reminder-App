import 'package:flutter/material.dart';

class user_input_page extends StatelessWidget {
  const user_input_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Testing. Testing. 1. 2. 3."),
        // child: Card(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       const ListTile(
        //         leading: Icon(Icons.album),
        //         title: Text('The Enchanted Nightingale'),
        //         subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: <Widget>[
        //           TextButton(
        //             child: const Text('BUY TICKETS'),
        //             onPressed: () {/* ... */},
        //           ),
        //           const SizedBox(width: 8),
        //           TextButton(
        //             child: const Text('LISTEN'),
        //             onPressed: () {/* ... */},
        //           ),
        //           const SizedBox(width: 8),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
