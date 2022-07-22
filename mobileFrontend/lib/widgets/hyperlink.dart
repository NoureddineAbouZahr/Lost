import 'package:flutter/material.dart';

class HL extends StatelessWidget {
  String text;
  // Function onPressed;

  HL({Key? key, required String this.text /*required Function this.onPressed*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {/* onPressed() */},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(text, style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),));
  }
}