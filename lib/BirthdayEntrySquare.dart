import 'package:flutter/material.dart';

class BirthdayEntrySquare extends StatelessWidget {
  final String child;

  BirthdayEntrySquare({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      child: Container(
        height: 40,
        color: Colors.teal[100],
        child: Center(
            child: Text(
          child,
          style: TextStyle(fontSize: 40),
        )),
      ),
    );
  }
}
