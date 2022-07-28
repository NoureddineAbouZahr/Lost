import 'package:flutter/material.dart';
import 'package:lost/pages/lost_or_found.dart';
import 'package:lost/services/services.dart';
import 'package:lost/utils.dart';
import 'package:lost/pages/login.dart';


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
  String? email = await ls.getItem('email');
  String? password = await ls.getItem('password');
  if (email != null && password != null) {
    final params = {"email": email, "password": password};
    Services().login('users/login', params).then((response) async {
      final token = response.body;
      await ls.setItem('token', token);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LostFound()));
    }
    ).catchError(print);
  } else {
    await Future.delayed(const Duration(seconds: 2),(){});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Login()));}
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
