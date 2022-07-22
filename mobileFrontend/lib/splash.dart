import 'package:flutter/material.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
      child: Container(
        child:
        CircleAvatar(
          backgroundImage: const AssetImage('assets/logo.png'),
          radius: width / 2.5,
          backgroundColor: Colors.transparent,
        ),
      ),),
    );
  }
}
