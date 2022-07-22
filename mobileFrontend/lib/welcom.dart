import 'package:flutter/material.dart';
import './widgets/lost_button.dart';
import './pages/signup.dart';
import './widgets/hyperlink.dart';
import 'package:lost/splash.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome', style: TextStyle(fontSize: width / 8)),
          CircleAvatar(
            backgroundImage: const AssetImage('assets/logo.png'),
            radius: width / 2.5,
            backgroundColor: Colors.transparent,
          ),
          LostButton(text: 'Log In', onPressed: () => {}),
          const SizedBox(height: 15),
          HL(text: "Log In"),
        ],
      )),
    );
  }
}

void switchPage(BuildContext context, String name) {
  switch (name) {
    case 'signup':
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const Signup()));
        break;
      }
  }
}
