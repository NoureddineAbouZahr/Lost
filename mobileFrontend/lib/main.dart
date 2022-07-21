import 'package:flutter/material.dart';

bool isLogin = false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: isLogin ? Home(logindata) : Login(),
      home: Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Welcome'),
          CircleAvatar(
            backgroundImage: const AssetImage('assets/logo.png'),
            radius: MediaQuery.of(context).size.width / 2.5,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
