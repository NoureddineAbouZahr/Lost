import 'package:flutter/material.dart';
import 'package:lost/pages/login.dart';
import 'package:lost/utils.dart';
import '../widgets/lost_button.dart';
import 'signup.dart';

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
          LostButton(
              text: 'Sign Up',
              onPressed: () => {switchPage(context, () => const Signup())}),
          const SizedBox(
            height: 20.0,
          ),
          LostButton(
              text: 'Log In',
              secondary: true,
              onPressed: () => {switchPage(context, () => const Login())}),
          const SizedBox(height: 15),
        ],
      )),
    );
  }
}
