import 'package:flutter/material.dart';
import 'package:lost/splash.dart';
import './widgets/lost_button.dart';
import './pages/signup.dart';
import 'package:lost/splash.dart';

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
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      // home: isLogin ? Home(logindata) : Login(),
      home: const Splash(),
    );
  }
}


