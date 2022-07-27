import 'package:flutter/material.dart';
import 'package:lost/main.dart';

class LostButton extends StatelessWidget {
  String text;
  Function onPressed;

  bool secondary;

  LostButton(
      {Key? key, required String this.text, required Function this.onPressed, this.secondary = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width * 0.9,
        height: 50,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Text(text.toUpperCase(), style: TextStyle(color: !secondary ? Color(0xff333333) : MainCol, fontSize: 20, fontWeight: FontWeight.bold),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(!secondary ? MainCol : Color(0xff333333)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
              ))),
        ));
  }
}
