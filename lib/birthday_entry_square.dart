import 'package:flutter/material.dart';

class birthday_entry_square extends StatelessWidget {
  final String nameChild;
  final int birthdayChild;

  birthday_entry_square({required this.nameChild, required this.birthdayChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      child: Container(
        height: 40,
        color: Colors.teal[100],
        child: Row(
          children: [
            Expanded(
                child: Text(
              nameChild,
              style: TextStyle(fontSize: 20),
            )),
            Expanded(
              child: Text(
                birthdayChild.toString(),
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
