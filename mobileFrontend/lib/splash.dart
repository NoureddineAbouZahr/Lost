import 'package:flutter/material.dart';
import 'package:lost/pages/lost_or_found.dart';
import 'package:lost/services/services.dart';
import 'package:lost/utils.dart';
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
_navigatetohome() async{
  await ls.ready;
  // ls.clear();
  String? email = ls.getItem('email');
  String? password = ls.getItem('password');
  if (email != null && password != null) {
    final params = {"email": email, "password": password};
    Services().login('users/login', params).then((response) {
      try {
        final token = response.body;
        ls.setItem('token', token);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LostFound()));
      } finally {}
    }
    ).catchError(print);
  } else {
    await Future.delayed(const Duration(seconds: 2),(){});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Welcome()));}
}


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: MainCol,
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
