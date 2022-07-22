import 'package:flutter/material.dart';
void switchPage(BuildContext context, Function() f) {
  Navigator.push( context, MaterialPageRoute(builder: (c) =>  f() ));
}