import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost/pages/signup.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';
import 'package:http/http.dart' as http;

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

            LostButton(text: 'Log In', onPressed: () => {}),
            HL(text: "Sign Up",onPressed: ()=>{
              switchPage(context,()=>Signup())
            },),
          ],
        ),
      ),
    );
  }
}
Future<http.Response> createAlbum(String title) {
  return http.post(
    Uri.parse(''),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      
    }),
  );
}