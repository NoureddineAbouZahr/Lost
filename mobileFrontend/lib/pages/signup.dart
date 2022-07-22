import 'package:flutter/material.dart';
import 'package:lost/pages/login.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
            LostInput(labelText: 'Name', hintText: 'Enter Your Name'),
            LostInput(labelText: 'Phone', hintText: 'Enter Your Phone Number'),
            LostInput(labelText: 'Email Address', hintText: 'Enter Your Email'),
            LostInput(labelText: 'Password', hintText: 'Enter Your Password'),
            LostInput(
                labelText: 'Password Confirmation',
                hintText: 'Confirm Your Password'),
            LostButton(text: 'Sign Up', onPressed: () => {}),
            HL(text: "Log In",onPressed: ()=>{
              switchPage(context,()=>const Login())
            },),
          ],
        ),
      ),
    );
  }
}
