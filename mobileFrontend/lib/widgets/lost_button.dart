import 'package:flutter/material.dart';

class LostButton extends StatelessWidget {
  String text;
  Function onPressed;

  LostButton(
      {Key? key, required String this.text, required Function this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width / 1.75,
        height: 50,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Text(text),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(width: 3, color: Color(0xDDEFD16F))))),
        ));
  }
}
