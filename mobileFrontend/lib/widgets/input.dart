import 'package:flutter/material.dart';

class LostInput extends StatelessWidget {
  String labelText;
  String hintText;

  LostInput({Key? key, required this.labelText, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: TextField(
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
