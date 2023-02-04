import 'package:flutter/material.dart';

/*
 * This class contains code and widgets for allowing a user to create a new
 * birthday entry.
 */
class user_input_page extends StatefulWidget {
  const user_input_page({Key? key}) : super(key: key);

  @override
  State<user_input_page> createState() => _user_input_pageState();
}

class _user_input_pageState extends State<user_input_page> {
  final myController = TextEditingController();

  static var input_data = [true, "test Name Billy", 1234];

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter a Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  input_data[0] = false;
                  Navigator.pop(context, input_data);
                },
                child: const Text("Confirm"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  input_data[0] = true;
                  Navigator.pop(context, input_data);
                },
                child: const Text("Cancel"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
// class BirthdayForm extends StatefulWidget {
//   const BirthdayForm({Key? key}) : super(key: key);
//
//   @override
//   State<BirthdayForm> createState() => _BirthdayFormState();
// }
//
// class _BirthdayFormState extends State<BirthdayForm> {
//   final myController = TextEditingController();
//
//   @override
//   void dispose() {
//     myController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: myController,
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Enter a Name',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   input_data[0] = false;
//                   Navigator.pop(context, input_data);
//                 },
//                 child: const Text("Confirm"),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   input_data[0] = true;
//                   Navigator.pop(context, input_data);
//                 },
//                 child: const Text("Cancel"),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
