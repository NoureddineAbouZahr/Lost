import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:lost/pages/lost_or_found.dart';
import 'package:lost/pages/signup.dart';
import 'package:lost/services/services.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import '../widgets/hyperlink.dart';
import 'package:http/http.dart' as http;

import '../widgets/treeview.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var cats;


  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (cats == null) {
      getCats().then((a) => {
        print(a.body)
      });

    }
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
                  controller: password,
                ),
                LostButton(text: 'Log In', onPressed: () => authorizeData()),
                HL(
                  text: "Sign Up",
                  onPressed: () => {switchPage(context, () => Signup())},
                ),
                TV(
                    subs: [
                      'Laptops',
                      'Computers'
                    ],
                    onSelect: (name) => {
                      debugPrint(name)
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> getCats() {
    return sendToApiGet('categories/getCategories');
  }

  authorizeData() async {
    final params = {
      "email": email.text,
      "password": password.text
    };
    print(params);
    final response = await Services().login('users/login', params);
    final token=response.body;

    if (response.statusCode == 200) {
      ls.setItem('token', token);
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=> LostFound()));

    }
  }
}
