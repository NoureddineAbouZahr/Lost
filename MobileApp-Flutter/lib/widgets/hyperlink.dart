import 'package:flutter/material.dart';
import 'package:lost/pages/signup.dart';
import '../pages/login.dart';
import '../utils.dart';

class HL extends StatelessWidget {
  String text;
  Function onPressed;

  HL({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {onPressed()},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ));
  }
}
