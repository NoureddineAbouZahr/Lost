import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:lost/pages/login.dart';
import 'package:lost/widgets/treeview.dart';
import '../services/services.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController cp = new TextEditingController();
  TextEditingController name = new TextEditingController();

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
          child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sign Up', style: TextStyle(fontSize: 30.0)))),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('With your existing account', style: TextStyle(fontSize: 20.0)))),

            const Padding(padding: EdgeInsets.only(bottom: 20)),
            LostInput(
              labelText: 'Name',
              hintText: 'Enter Your Name',
              controller: name,
            ),
            LostInput(
              labelText: 'Phone',
              hintText: 'Enter Your Phone Number',
              controller: phone,
            ),
            LostInput(
              labelText: 'Email Address',
              hintText: 'Enter Your Email',
              controller: email,
            ),
            LostInput(
              labelText: 'Password',
              hintText: 'Enter Your Password',
              controller: password,
              dp: true,
            ),
            LostInput(
              labelText: 'Password Confirmation',
              hintText: 'Confirm Your Password',
              controller: cp,
              dp: true,
            ),
            LostButton(text: 'Register', onPressed: () => authorizeData()),
            SizedBox(height: 10),
            LostButton(
                secondary: true,
                text: 'Log In',
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (c) => Login()))),
          ],
        ),
      ])),
    );
  }

  authorizeData() async {
    final params = {
      "name": name.text,
      "phone": phone.text,
      "email": email.text,
      "password": password.text
    };
    if (password.text == cp.text &&
        name.text != '' &&
        phone.text != '' &&
        email.text != '' &&
        password.text != '') {
      print(params);
      final response = await Services().login('users/register', params);
      final token = response.body;

      if (response.statusCode == 200) {
        ls.setItem('token', token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Login()));
      }
    } else {
      print('password doesn\'t match');
    }
  }
}
