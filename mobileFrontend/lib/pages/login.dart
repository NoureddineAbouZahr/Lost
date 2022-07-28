import 'package:flutter/material.dart';
import 'package:lost/pages/lost_or_found.dart';
import 'package:lost/pages/signup.dart';
import 'package:lost/services/services.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';


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
                const SizedBox(height: 25),
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Log In', style: TextStyle(fontSize: 30.0)))),
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('With your existing account', style: TextStyle(fontSize: 20.0)))),

                Padding(padding: EdgeInsets.only(bottom: 20)),
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
                SizedBox(height: 10),
                LostButton(secondary: true, text: 'Register', onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Signup()))),
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
    Services().login('users/login', params).then((response) async {
        final token = response.body;
        await ls.setItem('token', token);
        await ls.setItem('email', email.text);
        await ls.setItem('password', password.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LostFound()));
        }
    ).catchError(print);
  }
}
