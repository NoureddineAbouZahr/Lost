import 'package:flutter/material.dart';

class LostInput extends StatelessWidget {
  String labelText;
  String hintText;
  bool dp;
  TextEditingController controller;

  LostInput(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.dp = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: TextField(
                controller: controller,
                obscureText: dp,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 50)),
                    labelText: labelText,
                    hintText: hintText),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
