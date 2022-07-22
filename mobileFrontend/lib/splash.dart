import 'package:flutter/material.dart';
import 'main.dart';
import './welcom.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
void initState() {
  super.initState();
  _navigatetohome();
}
_navigatetohome()async{
  await Future.delayed(const Duration(milliseconds: 2000),(){});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Welcome()));}



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
      child: Container(
        child:
        CircleAvatar(
          backgroundImage: const AssetImage('assets/logo.png'),
          radius: width / 2.25,
          backgroundColor: Colors.transparent,
        ),
      ),),
    );
  }
}
