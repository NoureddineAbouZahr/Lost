import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils.dart';

import 'package:http/http.dart' as http;

import '../widgets/treeview.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool catsLoad = false;
  List<TV> tvs = [];

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (!catsLoad) {
      getCats().then((a) {
        var cats = jsonDecode(a.body);
        cats.forEach((cat) {
          List<String> currentCatSubs = [];
          cat['subid'].forEach((subcat) => currentCatSubs.add(subcat['name']));

          tvs.add(TV(
            title: cat['name'],
            subs: currentCatSubs,
            onSelect: (name) {},
          ));
        });

        catsLoad = true;
        setState(() => {});
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
                Column(
                  children: tvs,
                )
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
}
