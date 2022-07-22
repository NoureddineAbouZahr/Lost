import 'package:flutter/material.dart';

class LostButton extends StatelessWidget {
  String text;
  Function onPressed;

  LostButton({Key? key, required String this.text, required Function this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 2,
      height: 50,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(text),
      ),
    );
  }

}
