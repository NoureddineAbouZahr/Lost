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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            const Text(
              'Sign Up',
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
            ),
            LostInput(
              labelText: 'Password Confirmation',
              hintText: 'Confirm Your Password',
              controller: cp,
            ),
            LostButton(text: 'Sign Up',  onPressed: () => authorizeData()),
            HL(
              text: "Log In",
              onPressed: () => {switchPage(context, () => const Login())},
            ),

          ],
        ),
      ),
    );
  }

  authorizeData() async {
    final params = {
      "name":name.text,
      "phone":phone.text,
      "email": email.text,
      "password": password.text
    };
    if(password.text==cp.text){
    print(params);
    final response = await Services().login('users/register', params);
    final token=response.body;

    if (response.statusCode == 200) {
      ls.setItem('token', token);
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=> Login()));

    }}
    else{
      print('password doesn\'t match');
    }
  }
}
