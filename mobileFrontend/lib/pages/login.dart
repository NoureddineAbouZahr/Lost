import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: const [
              SizedBox(height: 5),
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 40,
                backgroundColor: Colors.transparent,
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            const Text(
              'Log In',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Divider(
                color: Color(0xFFefd16f),
                thickness: 2.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 35)),
            LostInput(labelText: 'Email Address', hintText: 'Enter Your Email'),
            LostInput(labelText: 'Password', hintText: 'Enter Your Password'),

            LostButton(text: 'Log In', onPressed: () => {
              switchPage(context,'login')
            }),
            HL(text: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
void switchPage(BuildContext context,String name) {
  switch (name) {
    case 'signup': {
      Navigator.push(context, MaterialPageRoute(builder: (c) => const Login()));
      break;
    }
  }
}