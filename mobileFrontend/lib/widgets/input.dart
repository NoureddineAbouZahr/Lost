import 'package:flutter/material.dart';

class LostInput extends StatelessWidget {
  String labelText;
  String hintText;

  LostInput({Key? key, required this.labelText, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide(width: 50)),
              labelText: labelText,
              hintText: hintText),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
