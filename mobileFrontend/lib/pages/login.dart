import 'package:flutter/material.dart';
import 'package:lost/pages/lost_or_found.dart';
import 'package:lost/pages/signup.dart';
import 'package:lost/services/services.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
      body: ListView(
        children: [
          Center(
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
                LostInput(
                  labelText: 'Email Address',
                  hintText: 'Enter Your Email',
                  controller: email,

                ),
                LostInput(

                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  controller: password, dp: true,
                ),
                LostButton(text: 'Log In', onPressed: () => authorizeData()),
                HL(
                  text: "Sign Up",
                  onPressed: () => {switchPage(context, () => Signup())},
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }



  authorizeData() async {
    final params = {"email": email.text, "password": password.text};
    if (email.text == '' || password.text == '') {
      return;
    }
    Services().login('users/login', params).then((response) {
        final token = response.body;
        ls.setItem('token', token);
        ls.setItem('email', email.text);
        ls.setItem('password', password.text);
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LostFound()));
        }
    );
  }
}
